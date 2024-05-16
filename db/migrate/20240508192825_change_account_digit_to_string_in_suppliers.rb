class ChangeAccountDigitToStringInSuppliers < ActiveRecord::Migration[7.1]
  def change
    change_column :suppliers, :account_digit, :string
  end
end
