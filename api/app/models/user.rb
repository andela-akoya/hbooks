class User < ApplicationRecord
  has_secure_password
  validates_presence_of %i[username lastname firstname email password_digest]
  validates_inclusion_of :is_admin, in: [true, false]
  validates_uniqueness_of %i[username email], case_sensitive: false

  has_many :books, foreign_key: :created_by, dependent: :destroy, validate: true
  has_many :favourites, dependent: :destroy, validate: true
  has_many :favourite_books,
           source: :book,
           through: :favourites
  has_many :reviews, dependent: :destroy, validate: true
  has_many :books_reviewed,
           source: :book,
           through: :reviews
  has_many :transactions, dependent: :destroy, validate: true
end
