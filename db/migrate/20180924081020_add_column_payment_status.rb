class AddColumnPaymentStatus < ActiveRecord::Migration[5.2]
  def change
  	add_column :bookings, :payment, :boolean, default: false
  end
end
