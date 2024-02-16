class FinePayment < ApplicationRecord
  belongs_to :user, foreign_key: "member_id" 
end
