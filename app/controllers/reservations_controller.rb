class ReservationsController < ApplicationController

  def new
    @business = Business.find(params[:business_id])
    @user = current_user
    @reservation = Reservation.new
  end

  def create
    @user = current_user
    @business = Business.find(params[:business_id])

    @reservation = Reservation.new(allowed_params)

    if @reservation.save
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def index
  end


  private
  def allowed_params
    params.require(:reservation).permit(:start_time, :end_time,:name_of_reserver, :number_of_seat, :business_id, :user_id)
  end
end
