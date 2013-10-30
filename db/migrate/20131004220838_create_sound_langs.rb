class CreateSoundLangs < ActiveRecord::Migration
  def change
    create_table :sound_langs do |t|
      t.string :lang
      t.string :title
      t.text :description
      t.boolean :published
      t.belongs_to :sound
      t.string :status
      t.timestamps
    end
  end
end
