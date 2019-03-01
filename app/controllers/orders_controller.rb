class OrdersController < ApplicationController
  def create
    flight = Flight.find(params[:flight_id])
    order  = Order.create!(flight_sku: flight.sku,
                           amount: flight.price,
                           state: 'pending',
                           user: current_user)

    redirect_to new_flight_order_payment_path(flight, order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end
end
