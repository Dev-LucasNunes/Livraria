class DropAuthorsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :authors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
