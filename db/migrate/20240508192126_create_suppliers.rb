class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :account
      t.integer :account_digit, limit: 1
      t.string :account_type
      t.string :bank

      t.timestamps
    end
  end
end
