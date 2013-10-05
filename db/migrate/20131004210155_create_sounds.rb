class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
    	t.belongs_to :item
      	t.timestamps
    end
  end
end
