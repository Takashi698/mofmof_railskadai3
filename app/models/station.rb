class Station < ApplicationRecord
  belongs_to :estate, optional: true
end
