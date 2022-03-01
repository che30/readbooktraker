class Measurement < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates_presence_of :pages_read, :date
end
