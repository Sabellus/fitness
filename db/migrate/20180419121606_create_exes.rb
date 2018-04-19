class CreateExes < ActiveRecord::Migration[5.1]
  def change
    create_table :exes do |t|
      t.string :name
      t.string :description
      t.integer :count

      t.timestamps
    end
  end
end
