class CreateCrashes < ActiveRecord::Migration[5.2]
  def change
    create_table :crashes do |t|
      t.string :name
      t.string :url
      t.uuid :identifier, default: 'gen_random_uuid()'
      t.date :date

      t.timestamps
    end
  end
end
