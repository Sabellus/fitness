class AddDeletedAtToEx < ActiveRecord::Migration[5.1]
  def change
    add_column :exes, :deleted_at, :datetime
    add_index :exes, :deleted_at
  end
end
