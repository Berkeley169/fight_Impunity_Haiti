class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
    	t.belongs_to :item
      	t.timestamps
    end
  end
end
