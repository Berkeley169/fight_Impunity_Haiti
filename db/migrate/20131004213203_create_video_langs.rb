class CreateVideoLangs < ActiveRecord::Migration
  def change
    create_table :video_langs do |t|

      t.timestamps
    end
  end
end
