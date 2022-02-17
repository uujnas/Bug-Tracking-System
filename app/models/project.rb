class Project < ApplicationRecord
  belongs_to :user
  has_many :bug, dependent: :destroy
  validates :title, presence: true, uniqueness: true
end
