class CreateBinariesTagsTable < ActiveRecord::Migration
  def self.up
    create_table :binaries_tags, :id => false do |t|
        t.references :binary
        t.references :tag
    end
    add_index :binaries_tags, [:binary_id, :tag_id]
    add_index :binaries_tags, :tag_id
  end

  def self.down
    drop_table :binaries_tags
  end
end
