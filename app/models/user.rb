class User < ApplicationRecord
	validates :username, presence: true,
						 uniqueness: true
	validates :password, presence: true,
						 length: {minimum: 5},
						 confirmation: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :credit_card,	numericality: true

end
