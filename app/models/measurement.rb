class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates_presence_of :pages_read, :date
end
