class Admins::ReservationsController < ApplicationController
 def index
 end
 def new
	@pickadate = Pickadate.new
 	@reservation = Reservation.new

 	# @model = params["search"]["model"]
 	# @content = params["search"]["content"]
 	# @patients = search_for(@model,@content)
 end

 def confirm
 	@patient = Patient.find(params[:id])
 	session[:reservation] = params[:reservation]
 	session[:pickadate] = params[:pickadate]
 end

 def create
 end

 def destroy
 end

 def all
  	@reservations = Reservation.all
 end

 def today
 	@reservations = Reservation.joins(:pickadate).where(pickadates: {date: Date.current})
 end

 def search
 end


 private
 def search_for(model, content)
 	if model == 'membership_number'
 		Patient.where(membership_number: content)
 	else model == 'name'
 		Patient.where(name: content)
 	end
 end
end
