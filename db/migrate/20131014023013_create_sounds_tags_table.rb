class CreateSoundsTagsTable < ActiveRecord::Migration
  def self.up
    create_table :sounds_tags, :id => false do |t|
        t.references :sound
        t.references :tag
    end
    add_index :sounds_tags, [:sound_id, :tag_id]
    add_index :sounds_tags, :tag_id
  end

  def self.down
    drop_table :sounds_tags
  end
end
