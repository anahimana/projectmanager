class User < ActiveRecord::Base
  validates :email, uniqueness: true, on: :create
  has_many :projects
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
