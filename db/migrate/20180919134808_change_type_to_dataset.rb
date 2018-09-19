class ChangeTypeToDataset < ActiveRecord::Migration[5.2]
  def change
    rename_table :types, :datasets
  end
end
