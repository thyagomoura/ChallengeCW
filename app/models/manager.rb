class Manager < ApplicationRecord
    has_many :players
    accepts_nested_attributes_for :players, allow_destroy: true

    def as_json(options = {})
        super(include: :players)
    end
end
