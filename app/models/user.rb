class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }
  validates :gender, inclusion: { in: %w(male female other) }
  validates :password, length: { minimum: 8 }

  after_create -> { puts 'Congratulations!' }
end
