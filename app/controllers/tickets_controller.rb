class TicketsController < ApplicationController
  before_action :ticket_find, only: %i[show edit update destroy]
  before_action :set_variable, only: %i[new create edit update]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      send_email_time = @ticket.departure_time - 10.minutes
      # raise
      UserMailer.status_boarding(@ticket.user).deliver_later!(wait_until: send_email_time)
      redirect_to tickets_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to tickets_path
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_variable
    @places = Place.all
    @company = Company.all
  end

  def ticket_params
    params.require(:ticket).permit(:name, :number, :origin_id, :destination_id, :departure_time, :arrival_time, :company_id)
  end

  def ticket_find
    @ticket = Ticket.find(params[:id])
  end
end
