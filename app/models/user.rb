class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :tickets, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  has_many :orders, dependent: :destroy

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.from_omniauth(auth)
    # Either create a User record or update it based on the provider (Google) and the UID
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.remote_photo_url = auth.info.image
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
    end
  end

  # # To send an email after create an user
  # after_create :send_status_boarding_email

  private

  # def send_status_boarding_email
  #   UserMailer.status_boarding(self).deliver_now
  # end
end
