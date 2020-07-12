class Reservation < ApplicationRecord
  belongs_to :membership_number_id, optional: true
  belongs_to :exam_content_id, optional: true

  def preferred_datentime
	return Pickadate.find_by(id: self.pickadate_id).date
  end

end
