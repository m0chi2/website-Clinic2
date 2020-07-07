class ReservationsController < ApplicationController
  def index
     @reservation = Reservation.new
  end

  def new
  end

  def confirm
  end

  def create
    @reservation = Reservation.new
  end

  def thanks
  end
end
