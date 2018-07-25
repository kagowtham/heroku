class Location < ApplicationRecord
  has_many :accomadations
  has_many :selects
end
