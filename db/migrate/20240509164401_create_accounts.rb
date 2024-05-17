class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.string :account
      t.string :account_digit
      t.string :account_type
      t.string :bank
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
