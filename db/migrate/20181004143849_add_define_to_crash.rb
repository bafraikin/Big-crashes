class AddDefineToCrash < ActiveRecord::Migration[5.2]
  def change
           add_column :crashes, :defined, :boolean, default: false 
  end
end
