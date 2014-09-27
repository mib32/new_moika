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
    image = Image.find(car_wash.title_image)
    image_tag asset_path(image.image.medium.url) unless image.nil?
  end

  def widget_class widget, cw_widget
    widget == cw_widget ? 'pushed' : ''
  end
end
