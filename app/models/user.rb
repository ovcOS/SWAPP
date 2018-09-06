class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :requesters, class_name: 'Connection', foreign_key: :requester_id
  has_many :responders, class_name: 'Connection', foreign_key: :responder_id
  has_many :tag_users
  has_many :skill_users
  has_many :skills, through: :skill_users, after_add: :add_to_tag_users, dependent: :destroy
  has_many :tags, through: :tag_users, dependent: :destroy
  has_many :media, dependent: :destroy
  mount_uploader :profile_photo, PhotoUploader
  has_many :connections, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: true

  scope :for_ids_with_order, ->(ids) {
    order = sanitize_sql_array(
      ["position((',' || id::text || ',') in ?)", ids.join(',') + ',']
    )
    where(id: ids).order(order)
  }

  scope :search_by_fuzzy_skill, ->(skill, current_user) {
    User.joins(:skills).where("skills.name ILIKE \'%#{skill}%\'").where.not(id: current_user.id)
  }

  def self.best_matches(user)
    ids = joins(:tags).where(tags: { name: user.tags.pluck(:name)})
                      .group(:id)
                      .count.sort_by{|i,c| c}
                      .reverse.map(&:first) - [user.id]
    for_ids_with_order(ids)
  end

  def all_connections
     Connection.where(requester_id: id).or(Connection.where(responder_id: id))
  end

  def skill_names
    skills = self.skills.order("RANDOM()").limit(3)
    skills.map { |skill| skill.name.titleize }.join(', ').strip
  end

  def tag_names
    tags = self.tags.order("RANDOM()").limit(3)
    tags.map { |tag| tag.name.titleize }.join(', ').strip
  end

  def completed_profile?
    self.location.present? && self.skills.count > 0 && self.tags.count > 0 && self.media.count > 0 && self.profile_photo.present?
  end

  private

  def add_to_tag_users(skill)
    skill.tags.each do |tag|
      unless self.tags.include? tag
        self.tags << tag
      end
    end
  end

  # def remove_from_tag_users
  #   self.tags = []
  #   self.skills.each do |skill|
  #     add_to_tag_users(skill)
  #   end
  # end
end
