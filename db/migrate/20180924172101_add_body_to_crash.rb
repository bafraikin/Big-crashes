class AddBodyToCrash < ActiveRecord::Migration[5.2]
  def change
    add_column :crashes, :body, :text
  end
end
