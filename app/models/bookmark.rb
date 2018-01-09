class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :dish

  belongs_to :venue,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
