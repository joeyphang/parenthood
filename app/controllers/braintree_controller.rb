class BraintreeController < ApplicationController
	def new
		@client_token = Braintree::ClientToken.generate

		@booking = Booking.find(params[:id])

		# passing the price into payment form
		@workshop = @booking.workshop
		@price = @booking.workshop.price
		# @total_price = @price * (@reservations.end_date - @reservations.start_date).to_i
	end

  	def checkout
		# passing the price into checkout
		@booking = Booking.find(params[:id])
		@booking.user_id = current_user.id
		@workshop = @booking.workshop
		@price = @booking.workshop.price
		# @total_price = @price * (@reservations.end_date - @reservations.start_date).to_i

		nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

		result = Braintree::Transaction.sale(
		   :amount => @price, 
		   :payment_method_nonce => nonce_from_the_client,
		   :options => {
		   	:submit_for_settlement => true
		   }
	   )
		if result.success?
			@booking.update(:payment => true)

			flash[:success] = "Payment Successful"
			redirect_to workshop_booking_path(@booking)


		else
			flash[:error] =  "Transaction failed. Please try again."
			redirect_to root_path
		end
		
	end
end
