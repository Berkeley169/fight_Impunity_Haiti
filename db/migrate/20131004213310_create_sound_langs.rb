class CreateSoundLangs < ActiveRecord::Migration
  def change
    create_table :sound_langs do |t|
      t.string :language

      t.timestamps
    end
  end
end
