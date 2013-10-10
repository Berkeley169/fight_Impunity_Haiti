class CreateBinaryLangs < ActiveRecord::Migration
  def change
    create_table :binary_langs do |t|
      t.string :lang
      t.string :title
      t.text :description
      t.boolean :published
      t.belongs_to :binary
      t.timestamps
    end
  end
end
