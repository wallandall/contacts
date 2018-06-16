class Group < ApplicationRecord
  has_many :contacts
  validates :name, presence: true
  validates :name, uniqueness: true
end
