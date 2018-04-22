class CreateExesPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :exes_programs do |t|
      t.references :ex
      t.references :program
    end
  end
end
