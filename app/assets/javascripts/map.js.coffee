# yandex map on main page

class @MapRenderer

  @default_settings :
    map:
      center: [55.76, 37.64]
      zoom: 11



  @init:  =>
    # if window.navigation_data == undefined
    @settings = @default_settings
    # else
    #   @settings = window.navigation_data

    console.log 'map renderer init called'
    @myMap = window.map = new window.ymaps.Map("map", @settings.map)
    @myMap.behaviors.enable('scrollZoom')
    # @searchControl = new SearchAddress(@myMap, $('#map_search form'))
    # @trafficControl = new ymaps.control.TrafficControl({providerKey: 'traffic#actual', shown: true})
    # @trafficProvider = @trafficControl.getProvider('traffic#actual')
    # @traffic_init()
    

    # @myMap.controls
    #   # Кнопка изменения масштаба.
    #   .add('zoomControl', { left: 5, top: 5 })
    #   # Список типов карты
    #   .add('typeSelector')
    #   # Стандартный набор кнопок
    #   .add('mapTools', { left: 35, top: 5 })
    #   .add('routeEditor', { left: 130, top: 5 })
    #   .add(@trafficControl, {top: 50, left: 40})
    # console.log "map renderer init end"
    # dfd = $.Deferred()
    # flag = $('.ymaps-map').length
    # while flag == 0
    #   flag = $('.ymaps-map').length
    # dfd.resolve()
    console.log "map renderer init true end"
    # return dfd.promise()

# $ ->
  #renderer = new MapRenderer
  #setTimeout(ymaps.ready(MapRenderer.init()),0)
  #setTimeout(CarWashLoader.load PlacemarksRenderer.render, 0)



setPosition = (position) ->
  window.navigation_data =
    map:
      center: [position.coords.latitude,position.coords.longitude]
      zoom: 13
  # if MapRenderer.myMap
    # MapRenderer.myMap.setCenter([position.coords.latitude, position.coords.longitude], 13)
    # PlacemarksRenderer.putMeToMap()

# if navigator.geolocation
  # navigator.geolocation.getCurrentPosition(setPosition);

window.ydo = ->
  console.log(1)
  MapRenderer.init()
  console.log(2)
  TrafficProvider.init()
  console.log "CarWashLoader"
  $.when(CarWashLoader.load()).done (data) ->
    $.when(PlacemarksRenderer.render()).done (data) ->
      #setTimeOut(loadIvideon(), 100000)
ymaps.ready ->
  window.ydo()
###
  window.setInterval(updateTraffic,1*60*1000)
###



