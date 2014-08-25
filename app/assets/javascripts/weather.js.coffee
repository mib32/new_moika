$ ->
  url = "http://api.worldweatheronline.com/free/v1/weather.ashx\
  ?q=Moscow&format=json&num_of_days=1&date=today&fx=no&cc=yes&key=2rcm7aauw65cverta3rnvf3j"
  $.get(url, (data) ->
    $('#weather #deg').html("#{data.data.current_condition[0].temp_C}&deg;C")
  , 'jsonp')
