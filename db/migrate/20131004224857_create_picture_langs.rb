class CreatePictureLangs < ActiveRecord::Migration
  def change
    create_table :picture_langs do |t|
      t.string :language
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
