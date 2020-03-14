class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :name, presence: true


  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
  has_many :projects
  has_one :profile

  accepts_nested_attributes_for :profile, allow_destroy: true
end
