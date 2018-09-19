class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name, unique: true
      t.string :url, unique: true
      t.integer :nb_of_crash
      t.boolean :scraped, default: false
      t.string :description, default: nil

      t.timestamps
    end
  end
end
