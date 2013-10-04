class AddPictureLangIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :picture_lang_id, :integer
  end
end
