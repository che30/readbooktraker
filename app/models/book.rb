class Book < ApplicationRecord
  belongs_to :cat
  validates_presence_of :name, :author, :isbn, :number_of_pages
  validates_uniqueness_of :isbn
  has_many :measurements
  belongs_to :user
end
