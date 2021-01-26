class Climb < ApplicationRecord
  has_many :comments
  has_many :climbers, through: :comments
  accepts_nested_attributes_for :comments
end
