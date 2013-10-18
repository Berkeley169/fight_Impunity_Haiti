class CreateVideoLangs < ActiveRecord::Migration
  def change
    create_table :video_langs do |t|
      t.string :lang
      t.string :title
      t.text :description
      t.boolean :published
      t.belongs_to :video
      t.timestamps
    end
  end
end
