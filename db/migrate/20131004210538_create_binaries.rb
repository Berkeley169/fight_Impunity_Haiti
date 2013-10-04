class CreateBinaries < ActiveRecord::Migration
  def change
    create_table :binaries do |t|
    	t.string :language
      	t.timestamps
    end
  end
end
