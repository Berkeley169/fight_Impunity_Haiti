class CreateTextLangs < ActiveRecord::Migration
  def change
    create_table :text_langs do |t|
      t.string :lang
      t.string :title
      t.text :description
      t.belongs_to :text
      t.boolean :published
      t.text :plain_text, :size => (64.kilobytes + 1)
      t.string :status
      t.timestamps
    end
  end
end
