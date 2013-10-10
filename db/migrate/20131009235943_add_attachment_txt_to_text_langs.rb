class AddAttachmentTxtToTextLangs < ActiveRecord::Migration
  def self.up
    add_column :text_langs, :txt_file_name, :string
    add_column :text_langs, :txt_content_type, :string
    add_column :text_langs, :txt_file_size, :integer
    add_column :text_langs, :txt_updated_at, :datetime
  end

  def self.down
    remove_column :text_langs, :txt_file_name
    remove_column :text_langs, :txt_content_type
    remove_column :text_langs, :txt_file_size
    remove_column :text_langs, :txt_updated_at
  end
end
