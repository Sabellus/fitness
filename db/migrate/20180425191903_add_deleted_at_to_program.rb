class AddDeletedAtToProgram < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :deleted_at, :datetime
    add_index :programs, :deleted_at
  end
end
