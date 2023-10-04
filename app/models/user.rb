class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
  :recoverable, :validatable, 
  :jwt_authenticatable, jwt_revocation_strategy: self

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "email", "encrypted_password", "id", "jti", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at"]
  end

  def jwt_payload
    super
  end
end
