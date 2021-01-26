class Climber < ApplicationRecord
  has_many :comments
  has_many :climbs, through: :comments
end
