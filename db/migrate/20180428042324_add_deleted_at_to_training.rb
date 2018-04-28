class AddDeletedAtToTraining < ActiveRecord::Migration[5.1]
  def change
    add_column :trainings, :deleted_at, :datetime
    add_index :trainings, :deleted_at
  end
end
