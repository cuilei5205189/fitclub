class Product < ApplicationRecord
  before_create :public_default
  has_one_attached :image, dependent: :destroy
  belongs_to :category

  has_many :cart_items, dependent: :destroy
  has_many :cart, through: :cart_items, dependent: :destroy

  has_many :comments, dependent: :destroy
  has_many :favours, dependent: :destroy
  has_many :collectors, through: :favours, source: :user

  scope :published, -> { where("is_public=?", true)}
  validates_presence_of :title, :description, :price, :quantity, :category_id
  validates_numericality_of :price, :quantity, greater_than: 0
  validates_numericality_of :discount, :greater_than => 0, :less_than => 100, :allow_blank => true
  validates_uniqueness_of :title

  def publish!
    self.is_public = true
    self.save
  end

  def hide!
    self.is_public = false
    self.save
  end

  def image_url
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_path(image, only_path: false)
    else
      default_image_url
    end
  end

  private
  def public_default
    self.is_public ||= false
  end
  

  def default_image_url
    "https://via.placeholder.com/300x200.png?text=No+Image"
  end
end
