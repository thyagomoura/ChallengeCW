class Player < ApplicationRecord
  belongs_to :manager, optional: true
  belongs_to :transfermarkt, optional: true
end
