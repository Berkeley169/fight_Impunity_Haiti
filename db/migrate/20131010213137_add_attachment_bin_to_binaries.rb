class AddAttachmentBinToBinaries < ActiveRecord::Migration
  def self.up
    add_column :binaries, :bin_file_name, :string
    add_column :binaries, :bin_content_type, :string
    add_column :binaries, :bin_file_size, :integer
    add_column :binaries, :bin_updated_at, :datetime
  end

  def self.down
    remove_column :binaries, :bin_file_name
    remove_column :binaries, :bin_content_type
    remove_column :binaries, :bin_file_size
    remove_column :binaries, :bin_updated_at
  end
end
