class Bookmark < ApplicationRecord
  # Direct associations

  has_many   :dishes_bookmarks,
             :dependent => :destroy

  belongs_to :venue,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  has_many   :dishes,
             :through => :dishes_bookmarks,
             :source => :dish

  # Validations

end
