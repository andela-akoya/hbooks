class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates_presence_of %i[user book date_borrowed]
end
