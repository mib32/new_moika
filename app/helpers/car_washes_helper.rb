module CarWashesHelper

  def actions(actions, tag)
    ret = ""
    unless actions.empty?
      actions.each do |action|
        ret += "<#{tag}>#{action.action_text.text}</#{tag}>"
      end
    else
      ret = "К сожалению, открытых вакансий нет"
    end
    raw(ret)
  end

  def car_wash_title(title)
    ret = ""
    if /\Aавтомойка/i =~ title
      ret = title
    else
      ret += "Автомойка #{title}"
    end
  end

  def car_wash_background car_wash
    unless car_wash.title_image.nil? 
      image = Image.find(car_wash.title_image) 
    else
      image = car_wash.images.first
    end
    image_tag asset_path(image.image.large.url) unless image.nil?
  end

  def widget_class widget, cw_widget
    widget == cw_widget ? 'pushed' : ''
  end
end
