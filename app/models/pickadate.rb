class Pickadate < ApplicationRecord
  belongs_to :reservation, optional: true
end
