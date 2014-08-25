# yandex map on main page

class @MapRenderer

  @default_settings :
    map:
      center: [55.76, 37.64]
      zoom: 11

  @init:  =>
    @settings = @default_settings
    console.log 'map renderer init called'
    @myMap = window.map = new window.ymaps.Map("map", @settings.map)
    @myMap.behaviors.enable('scrollZoom')
    @searchControl = new SearchAddress(@myMap, $('#map_search form'))
    @trafficControl = new ymaps.control.TrafficControl({providerKey: 'traffic#actual', shown: true})
    @trafficProvider = @trafficControl.getProvider('traffic#actual')
    @myMap.controls
      # Кнопка изменения масштаба.
      .add('zoomControl', { left: 5, top: 5 })
      # Список типов карты
      .add('typeSelector')
      # Стандартный набор кнопок
      .add('mapTools', { left: 35, top: 5 })
      .add('routeEditor', { left: 130, top: 5 })
      .add(@trafficControl, {top: 50, left: 40})
    console.log "map renderer init end"
    dfd = $.Deferred()
    flag = $('.ymaps-map').length
    while flag == 0
      flag = $('.ymaps-map').length
    dfd.resolve()
    return dfd.promise()

$ ->
  #renderer = new MapRenderer
  #setTimeout(ymaps.ready(MapRenderer.init()),0)
  #setTimeout(CarWashLoader.load PlacemarksRenderer.render, 0)
  ymaps.ready (->
    $.when(MapRenderer.init()).done ->
        console.log "CarWashLoader"
        $.when(CarWashLoader.load()).done (data) ->
          $.when(PlacemarksRenderer.render()).done (data) ->
            #setTimeOut(loadIvideon(), 100000)
  )

###
  window.setInterval(updateTraffic,1*60*1000)
###


