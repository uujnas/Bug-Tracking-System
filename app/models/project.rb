class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
