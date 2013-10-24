class CreateBinaries < ActiveRecord::Migration
  def change
    create_table :binaries do |t|
    	t.string :name
    	t.belongs_to :item
      	t.timestamps
    end
  end
end
