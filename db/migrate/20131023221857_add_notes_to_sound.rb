class AddNotesToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :notes, :text
  end
end
