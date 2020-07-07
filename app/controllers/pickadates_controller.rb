class PickadatesController < ApplicationController
  def new
  	@pickadate = Pickadate.new
  end

  def create
  	# session[:pickadate] = Pickadate.new(date: params[:date], time: params[:time])
  	# redirect_to new_reservation_path そのままreservationにsessionで飛ばした。ダメだったらpathをこっちに戻す
  end
end
