class CreatePictureLangs < ActiveRecord::Migration
  def change
    create_table :picture_langs do |t|
      t.string :lang
      t.string :title
      t.text :description
      t.boolean :published
      t.belongs_to :picture
      t.string :status
      t.timestamps
    end
  end
end
