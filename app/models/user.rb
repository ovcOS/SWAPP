class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requesters, class_name: 'Connection', foreign_key: :requester_id
  has_many :responders, class_name: 'Connection', foreign_key: :responder_id
  has_many :tags, through: :tag_users
  has_many :skills, through: :skill_users
  has_many :media

  validates :name, presence: true
end
