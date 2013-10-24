class AddNotesToBinary < ActiveRecord::Migration
  def change
    add_column :binaries, :notes, :string
  end
end
