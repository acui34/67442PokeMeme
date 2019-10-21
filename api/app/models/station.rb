class Station < ApplicationRecord
  # relationship
  has_many :memes 

  # validation
  validates_presence_of :name, :longitude, :latitude, :introduction


end
