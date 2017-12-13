require 'json'
class BusinessesController < ApplicationController
  def index
    @business = Business.where(term: params[:term])
  end
  def new
    @business =Business.new
  end

  def create
    @business = Business.where(term: params[:business][:term])
    @term = params[:business][:term]
    if @business.length <= 0
      require 'uri'
      require 'net/http'

      url = URI("https://api.yelp.com/v3/businesses/search?term=#{params[:business][:term]}&location=sanfrancisco&limit=50&Authorization=ENV[token]%20ENV[token_secret]")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["term"] = params[:business][:term]
      request["location"] = 'San Francisco'
      request["authorization"] = ENV['token'] + ' ' +  ENV['token_secret']
      request["cache-control"] = 'no-cache'
      request["postman-token"] = 'b10b0b57-438f-05ea-136d-2d4d75ab70a6'
      request["limit"] = '50'

      response = http.request(request)
      # puts response.read_body

      api_response = JSON.parse(response.read_body)

      api_response["businesses"].each do |yelp|
        @business= Business.new()
        @business.name = yelp["name"]
        @business.price = yelp["price"]
        @business.rating = yelp["rating"]
        @business.review_count  = yelp["review_count"]
        @business.city  = yelp["location"]["city"]
        @business.country  = yelp["location"]["country"]
        @business.address  = yelp["location"]["address1"]
        @business.country  = yelp["location"]["country"]
        @business.zip_code  = yelp["location"]["zip_code"]
        @business.state  = yelp["location"]["state"]
        @business.term = @term
        @business.image_url = yelp["image_url"]
        @business.save
      end
      redirect_to businesses_path(term: params[:business][:term])
    else
      # @business = Business.where(term: params[:business][:term])
      redirect_to businesses_path(term: params[:business][:term])
    end
  end

  def show
    @user = current_user
    @business = Business.find(params[:id])
    @reservation = Reservation.where(business_id: @business.id, user_id: @user.id).last
  end

  private
    def allowed_params
      params.require(:business).permit(:rating,:price,:phone,:name,:review_count,:image_url,:city,:country,:address,:state,:zip_code,:term )
    end
end
