class RemoveFieldsFromSuppliers < ActiveRecord::Migration[7.1]
  def change
    remove_column :suppliers, :account, :string
    remove_column :suppliers, :account_digit, :string
    remove_column :suppliers, :account_type, :string
    remove_column :suppliers, :bank, :string
  end
end
