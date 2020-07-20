class Patients::HomesController < ApplicationController
	def index
	end

	def show
	end

	def reservation
		@reservations = Reservation.where(membership_number: current_patient.membership_number)
	end
end
