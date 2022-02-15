class User < ApplicationRecord
  has_many :project
  has_one_attached :profile_pic
  validates :profile_pic, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[admin project_manager developer]

  after_initialize :set_default_role

  def set_default_role
    self.role ||= :developer
  end
end
