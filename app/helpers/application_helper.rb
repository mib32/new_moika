module ApplicationHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

  def resource_name
    :user
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
  
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def nav_to name, path, image_path
    if we_are_there?(path)
      klass = 'active'
    else
      klass = nil
    end
    content_tag :li, class: klass do
      link_to(name, path) +
      image_tag(asset_path image_path)
    end
  end

  def we_are_there? path
    path.tr('/','') == request.fullpath.split('/').second.to_s
  end
end
