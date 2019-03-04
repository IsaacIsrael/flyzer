class OrdersController < ApplicationController
  def create
    flight = Flight.find(params[:flight_id])
    order  = Order.create!(flight_sku: flight.sku,
                           amount: flight.price * order_params[:order_seat].to_i,
                           state: 'pending',
                           user: current_user,
                           seat: order_params[:order_seat].to_i)

    redirect_to new_flight_order_payment_path(flight, order)
  end

  def show
    @order = current_user.orders.where(state: 'paid').find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_seat)
  end
end
