class AddDishCountToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :dishes_count, :integer
  end
end
