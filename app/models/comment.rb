class Comment < ApplicationRecord

  belongs_to :climb
  belongs_to :user 

  validates_length_of :content, minimum: 3, maximum: 50, allow_blank: false

end
