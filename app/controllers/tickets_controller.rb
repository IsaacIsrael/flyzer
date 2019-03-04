class TicketsController < ApplicationController
  before_action :ticket_find, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show

  end

  def new
    @ticket = Ticket.new
    @company = Company.all
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      UserMailer.status_boarding(@ticket.user).deliver_later!(wait_until: 1.minutes.from_now)
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

  def ticket_params
    params.require(:ticket).permit(:name, :number, :origin, :destiny, :departure_time, :arrival_time, :company)
  end

  def ticket_find
    @ticket = Ticket.find(params[:id])
  end
end
