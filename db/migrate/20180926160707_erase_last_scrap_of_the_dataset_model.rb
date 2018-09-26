class EraseLastScrapOfTheDatasetModel < ActiveRecord::Migration[5.2]
  def change
    remove_column :datasets, :last_scrap
  end
end
