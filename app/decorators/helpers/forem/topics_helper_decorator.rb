Forem::TopicsHelper.class_eval do
  def link_to_latest_post(topic)
    post = relevant_posts(topic).last
    text_1 = content_tag :div, "последний ответ: #{post.user.forem_name}"
    text_2 = content_tag :div, "#{time_ago_in_words(post.created_at)} #{t("ago_by")}"
    link_to raw([text_1,text_2].join), forem.forum_topic_path(post.topic.forum, post.topic, :anchor => "post-#{post.id}", pagination_param => topic.last_page), class: 'latest-post'
  end
end