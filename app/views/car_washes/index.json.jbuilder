#json.cache! CarWash, expires_in: 30.minutes do
#json.cache_collection! @car_washes, expires_in: 30.minutes do |car_wash|

	json.array!(@car_washes) do |car_wash|
	  json.extract! car_wash,
	    :id, :title, :address, :lat, :lon,
	    :contacts, :services, :price,
	    :zones_count,
	    :signal, 
	    :updated_at, :action_on_map, :grey, :widget_type, :widget_content, :categories_concated
	  json.url car_wash_url(car_wash, format: :json)
	  json.widget_title Widget.find_by_type(car_wash.widget_type).name unless car_wash.widget_type == 'normal'
	end
#end
