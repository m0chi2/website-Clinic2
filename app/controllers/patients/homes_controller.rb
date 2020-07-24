class Patients::HomesController < ApplicationController
	before_action :authenticate_patient!
	def index
	end

	def show
	end

	def reservation
		@reservations = Reservation.where(membership_number: current_patient.membership_number)
		@reservations = @reservations.page(params[:page]).reverse_order
	end
end
