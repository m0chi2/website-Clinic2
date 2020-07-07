class Reservation < ApplicationRecord
  belongs_to :membership_number_id
  belongs_to :exam_content_id
end
