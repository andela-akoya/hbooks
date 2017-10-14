class Favourite < ApplicationRecord
  validates_presence_of %i[user book]
  belongs_to :user
  belongs_to :book
end
