class CreateContractors < ActiveRecord::Migration[6.0]
  def change
    create_table :contractors do |t|
      t.string :name

      t.timestamps
    end
  end
end
