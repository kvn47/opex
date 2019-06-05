class Team < ApplicationRecord
  validates_presence_of :name, :location
  has_one_attached :logo
end
