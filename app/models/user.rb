class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart
  has_many :orders
  has_many :comments

  has_many :favours
  has_many :collections, through: :favours, source: :product

  def is_collect_of?(product)
    collections.include?(product)
  end

  def collect!(product)
    collections << product
  end

  def un_collect!(product)
    collections.delete(product)
  end
  
  def avatar_url
    if avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
    else
      default_avatar_url
    end
  end

  private
  def default_avatar_url
    "https://picsum.photos/30/30?random=#{rand(1..100)}"
  end
  
end
