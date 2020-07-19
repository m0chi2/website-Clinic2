class ReservationsController < ApplicationController
  def index
    @pickadate = Pickadate.new

  end

  def new
    @reservation = Reservation.new
    session[:pickadate] = Pickadate.new(pickadate_params)
  end

  def confirm
    session[:reservation] = params[:reservation]
    #session[:reservation] = Reservation.new(reservation_params)
    #birthdayのみstrong parameterで取得できていないので一時対処
  end

  def create
    @pickadate = Pickadate.new(session[:pickadate])
    @pickadate.save
    @reservation = Reservation.new(session[:reservation])
    @reservation.pickadate_id = @pickadate.id
    if current_patient == nil
      @reservation.membership_number = 0
      # 非会員も予約するなら診察券番号を入力する欄が必要
      @reservation.save
    end

    redirect_to reservations_thanks_path

  end

  def thanks
    @pickadates = Pickadate.all
    @reservations = Reservation.all
    session[:pickadate].clear
    session[:reservation].clear

  end

  private
  def pickadate_params
    params.require(:pickadate).permit(:date, :time)
  end
  def reservation_params
    params.require(:reservation).permit(:name, :name_kana, :birthday, :sex ,:phonenumber, :email, :exam_content, :bothering_start_id, :question_medical_history, :question_memo)
  end

end
