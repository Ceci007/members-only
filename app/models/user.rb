class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         # :confirmable,
         # :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :tweets, dependent: :destroy
end
