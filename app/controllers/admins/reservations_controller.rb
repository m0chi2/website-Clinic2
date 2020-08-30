class Admins::ReservationsController < ApplicationController
  before_action :authenticate_admin!

  def index
  end

  def new
    @pickadate = Pickadate.new
    @reservation = Reservation.new

    @q = Patient.ransack(params[:q])
    if params[:q]
      @patients = @q.result(distinct: true)
    else
      @patients = []
    end
  end

  def confirm
    @patient = Patient.find_by(membership_number: params[:membership_number])
    @pickadate = Pickadate.new(
      date: params[:date],
      time: params[:time]
    )

    session[:reservation] = params[:reservation]
    session[:pickadate] = params[:pickadate]
  end

  def create
  end

  def destroy
  end

  def all
    @q = Reservation.ransack(params[:q])
    @reservations = @q.result(distinct: true)
  end

  def today
    @reservations = Reservation.joins(:pickadate).where(
      pickadates: { date: Time.current.to_s(:date_jp) }
    )
  end

  def testpage
    numbers = [0, 1, 2, 3, 4, 5, 6]
    t1 = Time.new
    @numbers_map = numbers.map { |i| i + t1.day.to_i }
    @times_map = 20.times.map { |i| Time.parse("8:00") + 30.minutes * i }
  end

  private

  def search_for(model, content)
    if model == 'membership_number'
      Patient.where(membership_number: content)
    elsif model == 'name'
      Patient.where(name: content)
    end
  end
end
