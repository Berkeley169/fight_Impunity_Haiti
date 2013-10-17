class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
    	t.string :name
    	t.belongs_to :item
    	t.datetime :date
    	t.string :author
        t.text :plain_text, :size => (64.kilobytes + 1)
      	t.timestamps
    end
  end
end
