class OrdersController < ApplicationController
  def create
    flight = Flight.find(params[:flight_id])
    order  = Order.create!(flight_sku: flight.sku,
                           amount: flight.price,
                           state: 'pending',
                           user: current_user)

    redirect_to flight_order_path(flight[:id], order[:id])
  end

  def show
    @order = current_user.orders.where(state: 'pending').find(params[:id])
  end
end
