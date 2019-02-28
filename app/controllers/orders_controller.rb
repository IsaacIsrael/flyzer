class OrdersController < ApplicationController
  flight = Flight.find(params[:flight_id])
  order  = Order.create!(flight_sku: flight.sku,
                         amount: flight.price,
                         state: 'pending',
                         user: current_user)

  redirect_to new_order_payment_path(order)
end
