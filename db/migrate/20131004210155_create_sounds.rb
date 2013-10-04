class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|

      t.timestamps
    end
  end
end
