class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :role
      t.string :lang
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
