class Pickadate < ApplicationRecord
  def reservation_date
	  @pickadate = Pickadate.find(id: self.pickadate_id)
	  return @pickadate.date + @pickadate.time
  end

  belongs_to :reservation, optional: true

end
