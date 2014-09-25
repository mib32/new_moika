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
    path == request.fullpath || path.tr('/','') == request.fullpath.split('/').second.to_s
  end

  def currency_dynamics diff
    if diff > 0
      image_tag asset_path('up.png')
    else
      image_tag asset_path('down.png')
    end
  end
end
