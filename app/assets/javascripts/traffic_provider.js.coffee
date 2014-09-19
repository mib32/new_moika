class @TrafficProvider

  @init:  =>
    @actual = new ymaps.traffic.provider.Actual()
    @actual.setMap(MapRenderer.myMap)
    # @actual.state.events.add 'change', ->
    #   console.log('traffic state event = ' +JSON.stringify(@actual.state.getAll()))
    #   if (@actual.state.get('isInited'))
    #     # updateTraffic(true)
    #     console.log('inited')
    # @actual.state.get('level')
    # dfd = $.Deferred()
    # flag = @actual.state.get('isInited')
    # while flag == false
      # flag = @actual.state.get('isInited')
    # dfd.resolve()
    # return dfd.promise()
    # console.log(TrafficProvider.actual.state.get('isInited'))
    if $('#map').length > 0 
      we_are_at_index = true
    else
      we_are_at_index = false
    window.traffic_interval = window.setInterval -> 
      updateTraffic(we_are_at_index)
    ,1*1*1000

  @update: =>
    @actual.update()
    console.log('traffic state = ' + JSON.stringify(@actual.state.getAll()))
    @actual.state.events.add 'change', ->
      console.log('traffic state event = ' +JSON.stringify(@actual.state.getAll()))
      if (@actual.state.get('isInited'))
        updateTraffic(true)

