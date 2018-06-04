class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.integer :role
      t.integer :ldap_id

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :ldap_id, unique: true
  end
end
