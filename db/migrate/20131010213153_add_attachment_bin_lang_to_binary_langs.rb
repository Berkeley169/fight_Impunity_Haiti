class AddAttachmentBinLangToBinaryLangs < ActiveRecord::Migration
  def self.up
    add_column :binary_langs, :bin_lang_file_name, :string
    add_column :binary_langs, :bin_lang_content_type, :string
    add_column :binary_langs, :bin_lang_file_size, :integer
    add_column :binary_langs, :bin_lang_updated_at, :datetime
  end

  def self.down
    remove_column :binary_langs, :bin_lang_file_name
    remove_column :binary_langs, :bin_lang_content_type
    remove_column :binary_langs, :bin_lang_file_size
    remove_column :binary_langs, :bin_lang_updated_at
  end
end
