class CreateTagsTextsTable < ActiveRecord::Migration
  def self.up
    create_table :tags_texts, :id => false do |t|
        t.references :tag
        t.references :text
    end
    add_index :tags_texts, [:tag_id, :text_id]
    add_index :tags_texts, :text_id
  end

  def self.down
    drop_table :tags_texts
  end
end
