class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :listings
  
  has_many :sold_orders, foreign_key: "seller_id", class_name: "Order"
  has_many :bought_orders, foreign_key: "buyer_id", class_name: "Order"

  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    # auth hash info can be found here:
    # https://github.com/simi/omniauth-facebook#auth-hash
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.extra.raw_info.username
      # TODO: there should be some way to send this to the user via email
      # Basically, the idea here is the user signs in via facebook,
      # we get their email and username data from facebook then we generate a temporary password
      # for them. We send the password to their facebook email and notify them to update it ASAP.
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
