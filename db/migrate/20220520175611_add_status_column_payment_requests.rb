class AddStatusColumnPaymentRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :payment_requests, :status, :integer, default: 0, comment: '0: pending, 1: accepted, 2: approved, 3: rejected'
  end
end
