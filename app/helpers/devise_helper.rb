module DeviseHelper

  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence1 = I18n.t("errors.messages.not_saved1",
                      :resource => resource.class.model_name.human.downcase)
    sentence2 = I18n.t("errors.messages.not_saved2",
                      :count => resource.errors.count)

    html = <<-HTML
    <div id="error_explanation">
      <h4>#{sentence1}</h4>
      <h4>#{sentence2}</h4>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
