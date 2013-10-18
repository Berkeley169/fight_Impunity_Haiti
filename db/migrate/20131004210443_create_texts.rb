class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
    	t.string :name
    	t.belongs_to :item
    	t.datetime :date
    	t.string :author
      t.timestamps
    end
  end
end
