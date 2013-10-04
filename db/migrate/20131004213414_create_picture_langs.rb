class CreatePictureLangs < ActiveRecord::Migration
  def change
    create_table :picture_langs do |t|
      t.string :language

      t.timestamps
    end
  end
end
