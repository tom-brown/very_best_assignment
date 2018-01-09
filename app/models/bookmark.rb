class Bookmark < ApplicationRecord
  # Direct associations

  has_many   :dishes,
             :dependent => :nullify

  belongs_to :dish

  belongs_to :venue,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
