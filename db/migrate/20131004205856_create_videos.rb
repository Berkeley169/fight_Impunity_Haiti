class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.belongs_to :item
    	t.datetime :date
    	t.string :name
    	t.string :vid
      	t.timestamps
    end
  end
end
