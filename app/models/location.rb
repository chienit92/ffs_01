class Location < ApplicationRecord
  acts_as_tree order: "name DESC"

  has_many :shops
end
