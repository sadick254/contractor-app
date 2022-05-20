class CreatePaymentRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_requests do |t|
      t.money :amount
      t.string :currency
      t.text :description
      t.references :contractor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
