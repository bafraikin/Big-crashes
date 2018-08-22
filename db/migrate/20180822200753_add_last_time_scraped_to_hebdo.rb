class AddLastTimeScrapedToHebdo < ActiveRecord::Migration[5.2]
  def change
    change_table :hebdos do | t |
      t.timestamp :last_scrap, default: Time.new(1994,5,15, 7, 0, 0)
    end
  end
end
