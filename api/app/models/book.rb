class Book < ApplicationRecord
  validates_presence_of %i[title author image created_by]
  belongs_to :added_by, class_name: "User", foreign_key: :created_by
  has_many :favourites, dependent: :destroy, validate: true
  has_many :favourite_users,
           source: :user,
           through: :favourites
  has_many :reviews, dependent: :destroy, validate: true
  has_many :reviewers,
           source: :user,
           through: :reviews
end
