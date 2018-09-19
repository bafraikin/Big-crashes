class ChangeColumnOnCrashToBePolymorphic < ActiveRecord::Migration[5.2]
  def change
    rename_column :crashes, :hebdo_id, :source_id
    add_column :crashes, :source_type, :string
  end
end
