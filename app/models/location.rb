class Location < ApplicationRecord
  validates :zip_code, :street, :neighborhood, :city, :state, presence: true
  validates :zip_code, uniqueness: true
end
