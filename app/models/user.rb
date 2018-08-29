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

  scope :for_ids_with_order, ->(ids) {
    order = sanitize_sql_array(
      ["position((',' || id::text || ',') in ?)", ids.join(',') + ',']
    )
    where(id: ids).order(order)
  }

  def best_matches
    ids = User.joins(:tags).where(tags: { name: self.tags.pluck(:name)})
                      .group(:id)
                      .count.sort_by{|i,c| c}
                      .reverse.map(&:first) - [self.id]
    User.for_ids_with_order(ids)
  end

  private

  def add_to_tag_users(skill)
    skill.tags.each do |tag|
      unless self.tags.include? tag
        self.tags << tag
      end
    end
  end

  def remove_from_tag_users
    self.tags = []
    self.skills.each do |skill|
      add_to_tag_users(skill)
    end
  end
end
