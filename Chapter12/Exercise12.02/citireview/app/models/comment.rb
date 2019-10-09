class Comment < ApplicationRecord
  belongs_to :review
  validates :body, length: { maximum: 50 }
end
