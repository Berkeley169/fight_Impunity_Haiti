class AddNotesToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :notes, :string
  end
end
