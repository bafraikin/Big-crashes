class CreateHebdos < ActiveRecord::Migration[5.2]
  def change
    create_table(:hebdos) do |t|
      t.string :name
      t.string :url
      t.uuid :identifier, default: 'gen_random_uuid()'
      t.boolean :scraped, default: false
      t.timestamps
    end
  end
end
