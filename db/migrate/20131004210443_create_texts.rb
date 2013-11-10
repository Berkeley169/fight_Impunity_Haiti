class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
    	t.string :name
    	t.belongs_to :item
    	t.datetime :date
      t.timestamps
      t.string :subtype
      t.text :subtype_fields
      t.boolean :new
      t.boolean :pending
      t.boolean :in_progress
      t.boolean :published
      t.boolean :rejected
    end
  end
end
