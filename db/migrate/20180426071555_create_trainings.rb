class CreateTrainings < ActiveRecord::Migration[5.1]
  def change
    create_table :trainings do |t|
      t.string :name
      t.string :comment
      t.integer :circle
      t.integer :duration
      t.belongs_to :program, index: true
      t.timestamps
    end
  end
end
