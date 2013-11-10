class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.belongs_to :item
    	t.datetime :date
    	t.string :name
    	t.string :vid
      	t.timestamps
      t.boolean :new
      t.boolean :pending
      t.boolean :inprogress
      t.boolean :published
      t.boolean :rejected
    end
  end
end
