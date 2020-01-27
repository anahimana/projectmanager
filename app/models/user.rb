class User < ActiveRecord::Base
  validates :email, uniqueness: true, on: :create
  has_many :projects
  has_secure_password
end
