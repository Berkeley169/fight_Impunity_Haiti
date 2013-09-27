class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.datetime :date
      t.boolean :english
      t.boolean :french
      t.boolean :creole
      t.boolean :spanish

      t.timestamps
    end
  end
end
