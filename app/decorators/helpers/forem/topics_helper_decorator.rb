Forem::TopicsHelper.class_eval do
  def link_to_latest_post(topic)
    post = relevant_posts(topic).last
    text_1 = content_tag :div, "последний ответ: #{post.user.forem_name}"
    text_2 = content_tag :div, "#{time_ago_in_words(post.created_at)} #{t("ago_by")}"
    content_tag :div, sanitize([text_1,text_2].join), class: 'latest-post'
  end

  def new_since_last_view_text(topic)
    if forem_user
      topic_view = topic.view_for(forem_user)
      forum_view = topic.forum.view_for(forem_user)

      if forum_view
        if topic_view.nil? && topic.created_at > forum_view.past_viewed_at
          content_tag :super, "Новое"
        end
      end
    end
  end
end