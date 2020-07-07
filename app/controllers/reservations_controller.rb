class ReservationsController < ApplicationController
  def index
    @pickadate = Pickadate.new
  end

  def new
    session[:pickadate] = params[:pickadate]

  end

  def confirm
  end

  def create

  end

  def thanks
  end

  private
  def pickadate_params
  end

end
