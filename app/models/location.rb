class Location < ApplicationRecord
  has_many :accomadations
  has_many :itineraries
end
