class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
    	t.datetime :date
    	t.string :name
      	t.timestamps
    end
  end
end
