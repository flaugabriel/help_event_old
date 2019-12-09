class User < ApplicationRecord
	has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates_uniqueness_of :name
end
