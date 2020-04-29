class Building < ApplicationRecord
    belongs_to :customer
    belongs_to :user
    belongs_to :adress
    has_many :building_details
    has_many :batteries
end
