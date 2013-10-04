class AddTextLangIdToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :text_lang_id, :integer
  end
end
