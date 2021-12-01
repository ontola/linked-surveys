class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :otp_secret,
          class_name: LinkedRails.otp_secret_class.to_s,
          dependent: :destroy,
          foreign_key: :owner_id,
          inverse_of: :owner

  validates :email,
            allow_blank: false,
            format: {with: RFC822::EMAIL}

  def guest?
    false
  end

  def otp_active?
    otp_secret&.active?
  end
end
