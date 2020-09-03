class Reservation < ApplicationRecord
  belongs_to :pickadate, dependent: :destroy
  belongs_to :membership_number, optional: true
  belongs_to :exam_content, optional: true
  belongs_to :bothering_start

  validates :name, presence: true
  validates :name_kana, presence: true,
                        format: {
                          with: /[ァ-ヶー－][ァ-ヶ　ー－]+/,
                          message: "カタカナのみで入力して下さい"
                        }
  validates :birthday, presence: true
  validates :phonenumber, presence: true

  def reservation_date
    @pickadate = Pickadate.find_by(id: pickadate_id)
    @pickadate.date + @pickadate.time
  end

  def preferred_datentime
    Pickadate.find_by(id: pickadate_id).date
  end
end
