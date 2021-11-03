class Book < ApplicationRecord
  belongs_to :cat
  validates_presence_of :name,:author,:isbn,:number_of_pages
end
