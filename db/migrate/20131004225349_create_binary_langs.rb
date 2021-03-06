class CreateBinaryLangs < ActiveRecord::Migration
  def change
    create_table :binary_langs do |t|
      t.string :lang
      t.string :title
      t.text :description
      t.belongs_to :binary
      t.string :status
      t.timestamps
    end
  end
end
