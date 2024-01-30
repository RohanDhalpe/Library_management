class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  after_create -> { puts "Congratulations!" }
end
