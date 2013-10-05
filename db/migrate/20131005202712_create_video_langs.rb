class CreateVideoLangs < ActiveRecord::Migration
  def change
    create_table :video_langs do |t|
      t.string :language
      t.string :title
      t.text :description
      t.boolean :published

      t.timestamps
    end
  end
end
