class CreateAuthors < ActiveRecord::Migration[7.1]
  def change
    create_table :authors do |t|
      t.string :name, limit: 30
      t.string :nationality, limit: 10
      t.string :cpf
      t.date :date_of_birth

      t.timestamps
    end
  end
end
