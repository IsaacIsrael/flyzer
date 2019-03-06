class PaymentsController < ApplicationController
  before_action :set_order

  def new; end

  def create
    customer = Stripe::Customer.create(source: params[:stripeToken], email: params[:stripeEmail])
    charge = Stripe::Charge.create(customer:     customer.id, # You should store this customer id and re-use it.
                                   amount:       @order.amount_cents,
                                   description:  "Payment for flight #{@order.flight_sku} for order #{@order.id}",
                                   currency:     @order.amount.currency)
    @order.update(payment: charge.to_json, state: 'paid')
    flight = Flight.find_by(sku: @order.flight_sku)
    flight.update(available_seats: flight.available_seats - @order.seat)
    redirect_to tickets_path
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
