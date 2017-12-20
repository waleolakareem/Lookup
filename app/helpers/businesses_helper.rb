module BusinessesHelper
  def yelp(term,longitude,latitude,location)
    require 'uri'
    require 'net/http'

    url = URI("https://api.yelp.com/v3/businesses/search?term=#{@term}&longitude=#{@longitude}&latitude=#{@latitude}&limit=50&sort_by=distance&Authorization=ENV[token]%20ENV[token_secret]")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["term"] = 'food'
    request["location"] = '#{@location}'
    request["authorization"] = ENV['token'] + ' ' + ENV['token_secret']
    request["limit"] = '50'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'b10b0b57-438f-05ea-136d-2d4d75ab70a6'

    response = http.request(request)
    # puts response.read_body

    api_response = JSON.parse(response.read_body)

    api_response["businesses"].each do |yelp|
      @business= Business.new(allowed_params)
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
      @business.location = @location
      @business.image_url = yelp["image_url"]
      @business.longitude = yelp["coordinates"]["longitude"]
      @business.latitude = yelp["coordinates"]["latitude"]
      @business.distance = yelp["distance"]*0.000621371
      @business.image_url = yelp["image_url"]
      @business.save
    end
  end
end
