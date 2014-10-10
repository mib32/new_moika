#json.cache! CarWash, expires_in: 30.minutes do
#json.cache_collection! @car_washes, expires_in: 30.minutes do |car_wash|

	json.array!(@car_washes) do |car_wash|
	  json.extract! car_wash,
	    :id, :title, :address, :lat, :lon,
	    :contacts, :price,
	    :zones_count,
	    :signal, 
	    :updated_at, :action_on_map, :grey, :widget_type, :widget_content, :widget_title, :category_ids
	  #json.url car_wash_url(car_wash, format: :json)
	  # this is for performance
	  json.url "http://#{@hostname}:#{@port}/car_washes/#{car_wash.id}"
	end
#end
