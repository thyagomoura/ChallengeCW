class Contract < ApplicationRecord
  belongs_to :player, optional: true
end
