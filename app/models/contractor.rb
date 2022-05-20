class Contractor < ApplicationRecord
  has_many :payment_requests
end
