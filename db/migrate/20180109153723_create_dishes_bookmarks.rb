class CreateDishesBookmarks < ActiveRecord::Migration
  def change
    create_table :dishes_bookmarks do |t|
      t.integer :dish_id
      t.integer :bookmark_id

      t.timestamps

    end
  end
end
