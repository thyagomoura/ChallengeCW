class Player < ApplicationRecord
  belongs_to :manager, optional: true
  belongs_to :transfermarkt, optional: true
  has_one :contract

  #accepts_nested_attributes_for :contract
end
