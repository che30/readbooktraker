class Cat < ApplicationRecord
  has_many :books
  validates_presence_of :name
end
