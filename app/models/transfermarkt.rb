class Transfermarkt < ApplicationRecord
    has_many :players
    accepts_nested_attributes_for :players, allow_destroy: true
end
