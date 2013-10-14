class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :english
      t.string :french
      t.string :creole
      t.string :spanish

      t.timestamps
    end
  end
end
