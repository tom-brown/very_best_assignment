class Dish < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :dishes_bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :bookmarks,
             :through => :dishes_bookmarks,
             :source => :bookmark

  # Validations

end
