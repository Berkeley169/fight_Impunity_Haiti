class CreateBinaries < ActiveRecord::Migration
  def change
    create_table :binaries do |t|
    	t.string :name
    	t.belongs_to :item
      t.datetime :date
      	t.timestamps
      t.boolean :new
      t.boolean :pending
      t.boolean :inprogress
      t.boolean :published
      t.boolean :rejected
    end
  end
end
