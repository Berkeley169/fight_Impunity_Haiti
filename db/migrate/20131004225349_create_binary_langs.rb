class CreateBinaryLangs < ActiveRecord::Migration
  def change
    create_table :binary_langs do |t|
      t.string :language
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
