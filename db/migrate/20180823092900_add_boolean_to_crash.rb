class AddBooleanToCrash < ActiveRecord::Migration[5.2]
  def change
    change_table :crashes do | t |
      t.boolean :valid, default: true
  end
  end
end
