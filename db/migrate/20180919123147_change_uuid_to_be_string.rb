class ChangeUuidToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :crashes, :identifier, :string
  end
end
