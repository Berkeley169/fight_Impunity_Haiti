class AddNotesToBinary < ActiveRecord::Migration
  def change
    add_column :binaries, :notes, :text
  end
end
