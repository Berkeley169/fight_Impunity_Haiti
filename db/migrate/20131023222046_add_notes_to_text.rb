class AddNotesToText < ActiveRecord::Migration
  def change
    add_column :texts, :notes, :string
  end
end
