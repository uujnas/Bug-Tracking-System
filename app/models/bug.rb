class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :assign_bugs, dependent: :destroy

  validates :title, presence: true, uniqueness: true

end
