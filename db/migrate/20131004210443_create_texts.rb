class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
    	t.string :name
    	t.belongs_to :item
    	t.datetime :date
      t.timestamps
      t.string :subtype
      t.text :subtype_fields
    end
  end
end
