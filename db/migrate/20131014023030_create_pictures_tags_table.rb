class CreatePicturesTagsTable < ActiveRecord::Migration
  def self.up
    create_table :pictures_tags, :id => false do |t|
        t.references :picture
        t.references :tag
    end
    add_index :pictures_tags, [:picture_id, :tag_id]
    add_index :pictures_tags, :tag_id
  end

  def self.down
    drop_table :pictures_tags
  end
end
