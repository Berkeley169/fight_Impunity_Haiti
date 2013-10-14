class CreateBinariesTagsTable < ActiveRecord::Migration
  def self.up
    create_table :binarys_tags, :id => false do |t|
        t.references :binary
        t.references :tag
    end
    add_index :binarys_tags, [:binary_id, :tag_id]
    add_index :binarys_tags, :tag_id
  end

  def self.down
    drop_table :binarys_tags
  end
end
