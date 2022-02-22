class Bug < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :assign_bugs, dependent: :destroy

  enum status: %i[pending resolved closed reopen]
end
