class User < ApplicationRecord
  has_one_attached :avatar

  belongs_to :team

  validates_presence_of :name, :nickname, :email
end
