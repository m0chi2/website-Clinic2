class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	def top 
	end

	def about
	end

	def patients
		@patients = Patient.all
	end

	def patient
		@patient = Patient.find(params[:id])
		@reservations = Reservation.where(membership_number: @patient.membership_number)

		@posts = Post.where(patient_id: @patient.id)
		@posts = @posts.page(params[:page]).reverse_order

		@age = (Date.today.strftime("%Y%m%d").to_i - @patient.birthday.strftime("%Y%m%d").to_i) / 10000

	end

end
