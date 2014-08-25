module ParseData
  require "open-uri"
  require "json"

  DEFAULT_URI = "http://netbook:3000/users.json"

  HOST = "http://maps.yandex.ru"
  PATH = "/services/search/1.x/search.json"
  YA_ROW_COUNT = 2000
  YA_SEARCH_STRING = "автомойки Москвы"
  QUERY_HASH = {
    autoscale: 0,
    lang: "ru-RU",
    sll: "30.31349700000001,59.93853099999102",
    sspn: "0.745447,0.377012",
    ll: "37.633095,55.724799",
    origin: "maps-pager",
    results: YA_ROW_COUNT,
    spn: "2.169799804687493,0.6543974020819192",
    spn: "1.390894,0.723142",
    text: YA_SEARCH_STRING,
    type: "biz,psearch,web"
  }

  YA_SEARCH_QUERY = QUERY_HASH.to_query
  YA_SEARCH_URI = HOST + PATH + '?' + YA_SEARCH_QUERY

  def self.get_json
    JSON.parse open(YA_SEARCH_URI).read
  end

  def self.save_to_db(json_hash)
    CarWash.where(grey: true).delete_all
    tmp_ary = []
    json_hash['features'].each do |e|
      if e['properties']['CompanyMetaData'].nil?
        next
      end
      advert = e['properties']['CompanyMetaData']['Advert']
      services = ''
      unless advert.nil?
        services = advert['title'] + ' ' + advert['text']
      end
      features = e['properties']['CompanyMetaData']['Features'] unless e['properties']['CompanyMetaData'].nil?
      unless features.nil?
        features.each do |element|
          unless element['name'].nil? || element['value'].nil? || (not element['value'].is_a?(Array))
            services += ' ' + element['name'] + ':' + element['value'].join(', ') + '; '
          end
        end
      end
      car_wash_hash = {
        title: e['properties']['CompanyMetaData']['name'],
        address: e['properties']['CompanyMetaData']['address'],
        contacts: e['properties']['CompanyMetaData']['Phones'].nil? ?  (nil):(e['properties']['CompanyMetaData']['Phones'][0]['formatted']),
        lat: e['geometry']['coordinates'][1],
        lon: e['geometry']['coordinates'][0],
        services: services,
        #signal: (rand(2)==1),
        grey: true
      }
      tmp_ary << car_wash_hash
      if CarWash.near([car_wash_hash[:lat], car_wash_hash[:lon]], 0.1, :units => :km).count == 0
        CarWash.create(car_wash_hash)
      end
    end
    tmp_ary
  end

end
