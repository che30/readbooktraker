class Measurement < ApplicationRecord
  belongs_to :user
  validates_presence_of :pages_read
end
