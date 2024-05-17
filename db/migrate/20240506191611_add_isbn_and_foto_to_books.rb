class AddIsbnAndFotoToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :isbn, :string
    add_column :books, :photo, :string
  end
end
