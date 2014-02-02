class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :title
    	t.text :english, :size => (64.kilobytes + 1)
    	t.text :french, :size => (64.kilobytes + 1)
    	t.text :spanish, :size => (64.kilobytes + 1)
    	t.text :creole, :size => (64.kilobytes + 1)
      	t.timestamps
    end
  end
end
