class DishesBookmark < ApplicationRecord
  # Direct associations

  belongs_to :bookmark

  belongs_to :dish

  # Indirect associations

  # Validations

end
