class AddNotesToSound < ActiveRecord::Migration
  def change
    add_column :sounds, :notes, :string
  end
end
