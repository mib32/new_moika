module ApplicationHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  def resource_name
    :user
  end

  def resource_class
    'User'.constantize
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def current_path
    request.env['PATH_INFO']
  end
  


  def nav_to name, path, image
    if we_are_there?(path)
      klass = 'active'
    else
      klass = ''
    end
    content_tag :li, class: klass do
      link_to path, class: 'li' do
      # image_tag(asset_path image_path)
        content_tag(:div, name, class: 't') +
        content_tag(:div, nil, id: image, class: 'img')
      end
    end
  end

  def we_are_there? path
    unless @active_is_set
      if path == request.fullpath.sub(/\?.*/,'')

        @active_is_set = true
        return true
      elsif path.tr('/','') == request.fullpath.split('/').second.to_s
        true
      end
    end
  end

  def currency_dynamics diff
    if diff > 0
      image_tag asset_path('up.png')
    else
      image_tag asset_path('down.png')
    end
  end

  def parse_query src
    begin
      query = URI.parse(src).query
    rescue URI::InvalidURIError
      return ''
    end
  end

  def video_id src
    Rack::Utils.parse_nested_query(parse_query(src)).deep_symbolize_keys[:v]
  end
  def video_url src
    # byebug
    base = "//www.youtube.com/embed/"
    suffix = "?wmode=transparent"
    
    if !parse_query(src).nil? && (/wmode=transparent/ =~ src).nil?
      src = base + video_id(src) + suffix
    else
      src += suffix
    end
  end

  def my_best_in_place(object, field, opts = {})
    if current_user and (current_user.client? or current_user.admin?)
      best_in_place object, field, opts
    end
  end

  def ads_block
    if need_ads
      content_tag :div, id: 'ad' do
        render partial: 'ads'
      end
    end
  end


  def need_ads
    route = [controller.controller_name, controller.action_name]
    rules = [['map'], ['car_washes','show']]
    rules.each do |rule|
      case rule.size
      when 1
        if (rule & route).any?
          return false
        end
      else
        if rule == route
          return false
        end
      end
    end

    true
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end

  def map_relation_to_obj relation, key, attr
  "{"+relation.map do |rel|
    "#{rel.send(key)}: '#{rel.send(attr)}'"
  end.join(",")+"}"
  end
end
