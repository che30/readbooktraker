class User < ApplicationRecord
  has_secure_password
  has_many :measurements, dependent: :destroy
  validates_presence_of :username, :email, :password_digest
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  # validates :password, length: { in: 8..20 }
  # validates :username, length: { in: 4..15 }
  validates :email, :uniqueness => true
end
