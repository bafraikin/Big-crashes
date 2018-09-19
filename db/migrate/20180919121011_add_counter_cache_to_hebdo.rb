class AddCounterCacheToHebdo < ActiveRecord::Migration[5.2]
  def change
    change_table :hebdos do | t |
      t.integer :nb_of_crash
    end
  end
end
