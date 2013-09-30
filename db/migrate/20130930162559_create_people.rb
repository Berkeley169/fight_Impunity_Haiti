class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :speaks_french
      t.boolean :speaks_english
      t.boolean :speaks_creole
      t.boolean :speaks_spanish
      t.boolean :manager
      t.boolean :editor
      t.boolean :public

      t.timestamps
    end
  end
end
