class User < ApplicationRecord
  has_one_attached :avatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def avatar_url
    if avatar.attached?
      Rails.application.routes.url_helpers.rails_blob_path(avatar, only_path: true)
    else
      default_avatar_url
    end
  end
  def default_avatar_url
    "https://picsum.photos/200/200?random=#{rand(1..100)}"
  end
end
