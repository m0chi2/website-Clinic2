class Pickadate < ApplicationRecord
  belongs_to :reservation, optional: true
  validates :time, presence: true
  validates :date, presence: true, uniqueness: { scope: [:time] }

  def reservation_date
    @pickadate = Pickadate.find(id: pickadate_id)
    @pickadate.date + @pickadate.time
  end
end
