class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.integer :venue_id
      t.string :notes
      t.integer :dish_id

      t.timestamps

    end
  end
end
