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
      klass = nil
    end
    content_tag :li, class: klass do
      link_to(name, path) +
      # image_tag(asset_path image_path)
      content_tag(:div, nil, id: image, class: 'img')
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

  def video_url src
    base = "//www.youtube.com/embed/"
    suffix = "?wmode=transparent"
    query = URI.parse(src).query
    if !query.nil?
      #&& (/wmode=transparent/ =~ self.filename).nil?
      src = base + query[2..-1] + suffix
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
      if (rule & route).any?
        return false
      end
    end

    true
  end
end
