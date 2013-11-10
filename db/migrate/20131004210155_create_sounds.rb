class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.datetime :date
      t.string :name
    	t.belongs_to :item
      	t.timestamps
      t.boolean :new
      t.boolean :pending
      t.boolean :inprogress
      t.boolean :published
      t.boolean :rejected
    end
  end
end
