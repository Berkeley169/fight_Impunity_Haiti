class CreateTagsVideosTable < ActiveRecord::Migration
  def self.up
    create_table :tags_videos, :id => false do |t|
        t.references :tag
        t.references :video
    end
    add_index :tags_videos, [:tag_id, :video_id]
    add_index :tags_videos, :video_id
  end

  def self.down
    drop_table :tags_videos
  end
end
