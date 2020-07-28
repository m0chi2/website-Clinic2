class ReservationsController < ApplicationController
  def index
    @pickadate = Pickadate.new

  end

  def new
    if Pickadate.find_by(date: params[:pickadate][:date], time: params[:pickadate][:time])
        flash[:notice] = "予約が埋まっています。別の日時を指定してください。"
        redirect_to reservations_path
    end
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
    @reservation.membership_number = "B000000" # 非会員予約の場合、診察券番号は「B000000」とする
    @reservation.pickadate_id = @pickadate.id

    if current_patient
        @reservation.membership_number = current_patient.membership_number
        @reservation.name = current_patient.name
        @reservation.name_kana = current_patient.name_kana
        @reservation.birthday = current_patient.birthday
        @reservation.sex = current_patient.sex
        @reservation.email = current_patient.email
        @reservation.phonenumber = current_patient.phonenumber
    end

    if @reservation.save
        redirect_to reservations_thanks_path
    else
        flash[:notice] = "エラーが起きました。入力内容を正しくご記入ください。"
        render :index
    end
  end

  def thanks
    @pickadates = Pickadate.all
    @reservations = Reservation.all
    session[:pickadate].clear
    session[:reservation].clear
  end

end

private
  def pickadate_params
    params.require(:pickadate).permit(:date, :time)
  end
  def reservation_params
    params.require(:reservation).permit(:name, :name_kana, :birthday, :sex ,:phonenumber, :email, :exam_content, :bothering_start_id, :question_medical_history, :question_memo)
  end

