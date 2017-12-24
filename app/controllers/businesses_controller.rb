require 'json'
class BusinessesController < ApplicationController
  include BusinessesHelper

  def index
      @business = Business.all
      if params[:term] && params[:latitude] && params[:longitude] && params[:location]
        @business = Business.with_term(params[:term].to_s).with_location(params[:location].to_s).near([params[:latitude].to_f, params[:longitude].to_f], 50, :order => :distance)
      end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.where("term = ? AND location = ?", params[:business][:term], params[:business][:location])
    @term = params[:business][:term]
    @location = params[:business][:location]
    @longitude = params[:business][:longitude].to_f
    @latitude = params[:business][:latitude].to_f
    if @business.length <= 0
      yelp(@term,@location,@longitude,@location)
      redirect_to businesses_path(term: @term, latitude: @latitude, longitude: @longitude, location: @location)
    else
      redirect_to businesses_path(term: @term, latitude: @latitude, longitude: @longitude, location: @location)
    end
  end

  def show
    @user = current_user
    @business = Business.find(params[:id])
    @reservation = Reservation.where(business_id: @business.id, user_id: @user.id).last
  end

  def widget
  end

  private

    def allowed_params
      params.require(:business).permit(:rating,:price,:phone,:name,:review_count,:image_url,:city,:country,:address,:state,:zip_code,:term, :location,:latitude,:longitude )
    end
end
