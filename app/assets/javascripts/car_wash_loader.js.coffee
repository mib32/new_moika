class @CarWashLoader
  constructor: ->
  @cw_list = []

  @load: ->
    if window.car_wash != undefined
      CarWashLoader.parse_json window.car_wash
      return MapRenderer.myMap.setCenter(CarWashLoader.cw_list[0].coords)

    $.getJSON '/car_washes', (json) ->
      CarWashLoader.parse_json json
      

  @parse_json: (json) ->
    for row in json
        CarWashLoader.cw_list.push
          coords: [row.lat, row.lon],
          id: row.id,
          address: row.address,
          title: row.title,
          signal: row.signal,
          url: row.url,
          # url: "http://moika-77.ru/car_washes/#{row.id}",
          contacts: row.contacts,
          # services: row.services,
          blink: row.blink,
          main_action: row.main_action,
          action_on_map: row.action_on_map,
          widget_type: row.widget_type,
          widget_content: row.widget_content,
          widget_title: row.widget_title,
          grey: row.grey,
          # categories: row.categories_concated
          category_ids: row.category_ids

