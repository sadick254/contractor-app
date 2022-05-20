class PaymentRequest < ApplicationRecord
  belongs_to :contractor

  enum status: [:pending, :accepted, :approved, :rejected]
end
