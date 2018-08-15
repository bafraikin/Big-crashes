class AddBelongToAtCrash < ActiveRecord::Migration[5.2]
  def change
    change_table :crashes do | t |
      t.belongs_to :hebdo
    end
  end
end
