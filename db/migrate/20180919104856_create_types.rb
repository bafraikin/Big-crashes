class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :name, unique: true
      t.string :url, unique: true
      t.integer :last_nb_nhits
      t.boolean :scraped, default: false
      t.string :description, default: nil

      t.timestamps
    end
  end
end
