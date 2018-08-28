class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requesters, class_name: 'Connection', foreign_key: :requester_id
  has_many :responders, class_name: 'Connection', foreign_key: :responder_id
  has_many :tag_users
  has_many :skill_users
  has_many :skills, through: :skill_users, after_add: :add_to_tag_users, after_remove: :remove_from_tag_users, dependent: :destroy
  has_many :tags, through: :tag_users
  has_many :media

  validates :name, presence: true

  private

  def add_to_tag_users(skill)
    skill.tags.each do |tag|
      self.tags << tag
    end
  end

  def remove_from_tag_users(skill)
    user_tags = self.tags.to_a
    skill.tags.each do |tag|
      user_tags.delete_at(user_tags.index(tag) || user_tags.length)
    end
    self.tags.clear
    self.tags << user_tags
  end
end
