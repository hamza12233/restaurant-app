class AddCategoryIdToDish < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :dish_id, :integer
  end
end
