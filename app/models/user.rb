class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :admins, -> { where(type: "AdminUser") }
  scope :adults, -> { where(age: 18..) }
  scope :children, -> { where(age: ..18) }

  def adult?
    age >= 18
  end

  def child?
    age < 18
  end
end
