class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :english
      t.string :french
      t.string :creole
      t.string :spanish
      t.string :cat
      t.text :english_description, :size => (64.kilobytes + 1)
      t.text :french_description, :size => (64.kilobytes + 1)
      t.text :creole_description, :size => (64.kilobytes + 1)
      t.text :spanish_description, :size => (64.kilobytes + 1)
      t.integer :parent_id
      t.timestamps
    end
  end
end
