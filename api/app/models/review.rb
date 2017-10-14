class Review < ApplicationRecord
  validates_presence_of %i[user book review]
  belongs_to :user
  belongs_to :book
end
