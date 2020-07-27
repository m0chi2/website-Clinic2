class Pickadate < ApplicationRecord
	belongs_to :reservation, optional: true
	validates :time, presence: true
	validates :date, presence: true, uniqueness: { scope: [:time]}

  def reservation_date
	  @pickadate = Pickadate.find(id: self.pickadate_id)
	  return @pickadate.date + @pickadate.time
  end

end
