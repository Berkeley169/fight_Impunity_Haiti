class CreateBinaryLangs < ActiveRecord::Migration
  def change
    create_table :binary_langs do |t|
      t.string :language

      t.timestamps
    end
  end
end
