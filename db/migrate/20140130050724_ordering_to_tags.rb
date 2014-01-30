class OrderingToTags < ActiveRecord::Migration
  def up
  	add_column :tags, :ordering, :integer
  end

  def down
  	remove_column :tags, :order
  end
end
