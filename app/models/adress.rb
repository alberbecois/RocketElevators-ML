class Adress < ApplicationRecord
    has_one :building
    has_many :customer
end
