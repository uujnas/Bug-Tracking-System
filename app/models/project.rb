class Project < ApplicationRecord
  belongs_to :user
  has_many :bug
  validates :title, presence: true, uniqueness: true
end
