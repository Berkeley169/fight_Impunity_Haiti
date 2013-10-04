class CreateTextLangs < ActiveRecord::Migration
  def change
    create_table :text_langs do |t|

      t.timestamps
    end
  end
end
