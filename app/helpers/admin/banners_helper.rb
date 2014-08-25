module Admin::BannersHelper
  def banner_type_input(banner_type, banner_id, text, is_active)
    if is_active
      html = "<label class=\'col-lg-3 btn btn-sm btn-primary banner_type_radio_button active\'>".html_safe
    else
      html = "<label class=\'col-lg-3 btn btn-primary btn-sm banner_type_radio_button\'>".html_safe
    end
    html << "<input type='radio' name='banner_type' data-target=\'#tab-pane_#{banner_type}_#{banner_id}\'>".html_safe
    html << text.html_safe
    html << "</input>".html_safe
    html << "</label>".html_safe
  end
  
  def banner_tab_pane(banner_type, id, is_active, &block)
    if is_active
      html = "<div class=\'tab-pane fade in active\' id=\'tab-pane_#{banner_type}_#{id}\'>".html_safe
    else
      html = "<div class=\'tab-pane fade in \' id=\'tab-pane_#{banner_type}_#{id}\'>".html_safe
    end
    html << (capture(&block) if block_given?)
    html << "\n</div>".html_safe
  end
end
