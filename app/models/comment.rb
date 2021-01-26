class Comment < ApplicationRecord
  belongs_to :climber
  belongs_to :climb
  accepts_nested_attributes_for :climber
  accepts_nested_attributes_for :climb
end
