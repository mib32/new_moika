class @CarWashLoader
  constructor: ->
  @cw_list = []

  @load: ->
    $.getJSON '/car_washes', (json) ->
      for row in json
        CarWashLoader.cw_list.push
          coords: [row.lat, row.lon],
          id: row.id,
          address: row.address,
          title: row.title,
          signal: row.signal,
          url: row.url.slice(0,-5),
          contacts: row.contacts,
          services: row.services,
          blink: row.blink,
          main_action: row.main_action,
          action_on_map: row.action_on_map,
          videoned: row.videoned,
          discounted: row.discounted,
          brended: row.brended,
          gasolined: row.gasolined,
          repaired: row.repaired,
          tired: row.tired,
          signal_type: row.signal_type,
          grey: row.grey

