class Climb < ApplicationRecord

  validates :name, presence: true, uniqueness: true


  has_many :comments
  has_many :users, through: :comments
  belongs_to :climb_type

  accepts_nested_attributes_for :comments, reject_if: :all_blank
  accepts_nested_attributes_for :climb_type

  


end
