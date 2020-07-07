class AddDateAndTimeToReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :date, :string
    add_column :reservations, :time, :string
  end
end
