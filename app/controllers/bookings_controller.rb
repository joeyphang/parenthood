class BookingsController < ApplicationController

	def index
		@booking = Booking.all
	end

	def new
		@booking = Booking.new
		@workshop = Workshop.find(params[:workshop_id])
	end

	def create

		@booking = Booking.new(booking_params)
		@workshop = Workshop.find(params[:workshop_id])
		@booking.workshop_id = params[:workshop_id]
		@booking.user_id = current_user.id

		if @booking.save

			redirect_to workshop_booking_path
			flash[:notice] = "Booking Successful"
		else
			redirect_to workshops_path
			flash[:error] =  "#{@booking.errors.full_messages}"
		end
	end

	def show
		@booking = Booking.find(params[:id])
		@workshop = @booking.workshop
		@booking.workshop_id = params[:workshop_id]
		@booking.user_id = current_user.id
		
		@price = @workshop.price

	end

	def edit
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			redirect_to root_path
		else
			redirect_to workshop_path(@workshop)
		end
	end

	def destroy
	end


	private
	
	def booking_params
		params.require(:booking).permit(:title, :date, :price, :total, :user_id, :workshop_id)
	end


end
