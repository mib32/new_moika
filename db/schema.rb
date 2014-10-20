# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141020052111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_texts", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "action_types", force: true do |t|
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "actions", force: true do |t|
    t.integer  "car_wash_id"
    t.integer  "action_text_id"
    t.integer  "action_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_surveys", force: true do |t|
    t.string   "question"
    t.string   "answer_1"
    t.string   "answer_2"
    t.string   "answer_3"
    t.string   "answer_4"
    t.string   "answer_5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advertisements", force: true do |t|
    t.string   "text"
    t.string   "url"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banners", force: true do |t|
    t.string   "file"
    t.string   "filename"
    t.string   "place"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_wash_id"
    t.string   "type"
    t.string   "youtube_url"
  end

  add_index "banners", ["car_wash_id"], name: "index_banners_on_car_wash_id", using: :btree
  add_index "banners", ["type"], name: "index_banners_on_type", using: :btree

  create_table "banners_configs", force: true do |t|
    t.string   "place"
    t.string   "mode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "banner_id"
    t.string   "uploader_version"
  end

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_washes", force: true do |t|
    t.string   "title"
    t.string   "address"
    t.float    "lat"
    t.float    "lon"
    t.string   "contacts"
    t.text     "services"
    t.string   "price"
    t.integer  "zones_count"
    t.string   "video_url1"
    t.string   "video_url2"
    t.boolean  "signal",                                      default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "site_url"
    t.boolean  "blink",                                       default: false
    t.boolean  "signal_changed"
    t.boolean  "activated",                                   default: false
    t.string   "official_title"
    t.string   "u_address"
    t.string   "inn"
    t.boolean  "action_on_map",                               default: false
    t.boolean  "youtubed",                                    default: false
    t.string   "vk_url"
    t.string   "odn_url"
    t.decimal  "rating",              precision: 5, scale: 4, default: 0.0
    t.boolean  "videoned",                                    default: false
    t.string   "signal_type"
    t.string   "video_title1"
    t.string   "video_title2"
    t.boolean  "discounted",                                  default: false
    t.boolean  "grey",                                        default: false
    t.boolean  "brended",                                     default: false
    t.boolean  "gasolined",                                   default: false
    t.boolean  "repaired",                                    default: false
    t.boolean  "tired",                                       default: false
    t.integer  "title_image"
    t.string   "widget_type"
    t.string   "widget_content"
    t.datetime "updated_widget_at"
    t.string   "working_time"
    t.string   "title_video_url"
    t.text     "additional_services"
    t.string   "premial_status"
  end

  create_table "car_washes_categories", force: true do |t|
    t.integer  "car_wash_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "car_washes_categories", ["car_wash_id"], name: "index_car_washes_categories_on_car_wash_id", using: :btree

  create_table "car_washes_services", force: true do |t|
    t.integer  "car_wash_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "price"
  end

  add_index "car_washes_services", ["car_wash_id", "service_id"], name: "index_car_washes_services_on_car_wash_id_and_service_id", unique: true, using: :btree
  add_index "car_washes_services", ["car_wash_id"], name: "index_car_washes_services_on_car_wash_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "name"
    t.integer  "car_wash_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "currencies", force: true do |t|
    t.string   "name"
    t.decimal  "value",      precision: 8, scale: 2
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forem_categories", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "forem_categories", ["slug"], name: "index_forem_categories_on_slug", unique: true, using: :btree

  create_table "forem_forums", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "category_id"
    t.integer "views_count", default: 0
    t.string  "slug"
  end

  add_index "forem_forums", ["slug"], name: "index_forem_forums_on_slug", unique: true, using: :btree

  create_table "forem_groups", force: true do |t|
    t.string "name"
  end

  add_index "forem_groups", ["name"], name: "index_forem_groups_on_name", using: :btree

  create_table "forem_memberships", force: true do |t|
    t.integer "group_id"
    t.integer "member_id"
  end

  add_index "forem_memberships", ["group_id"], name: "index_forem_memberships_on_group_id", using: :btree

  create_table "forem_moderator_groups", force: true do |t|
    t.integer "forum_id"
    t.integer "group_id"
  end

  add_index "forem_moderator_groups", ["forum_id"], name: "index_forem_moderator_groups_on_forum_id", using: :btree

  create_table "forem_posts", force: true do |t|
    t.integer  "topic_id"
    t.text     "text"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reply_to_id"
    t.string   "state",       default: "approved"
    t.boolean  "notified",    default: false
  end

  add_index "forem_posts", ["reply_to_id"], name: "index_forem_posts_on_reply_to_id", using: :btree
  add_index "forem_posts", ["state"], name: "index_forem_posts_on_state", using: :btree
  add_index "forem_posts", ["topic_id"], name: "index_forem_posts_on_topic_id", using: :btree
  add_index "forem_posts", ["user_id"], name: "index_forem_posts_on_user_id", using: :btree

  create_table "forem_subscriptions", force: true do |t|
    t.integer "subscriber_id"
    t.integer "topic_id"
  end

  create_table "forem_topics", force: true do |t|
    t.integer  "forum_id"
    t.integer  "user_id"
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "locked",       default: false,      null: false
    t.boolean  "pinned",       default: false
    t.boolean  "hidden",       default: false
    t.datetime "last_post_at"
    t.string   "state",        default: "approved"
    t.integer  "views_count",  default: 0
    t.string   "slug"
  end

  add_index "forem_topics", ["forum_id"], name: "index_forem_topics_on_forum_id", using: :btree
  add_index "forem_topics", ["slug"], name: "index_forem_topics_on_slug", unique: true, using: :btree
  add_index "forem_topics", ["state"], name: "index_forem_topics_on_state", using: :btree
  add_index "forem_topics", ["user_id"], name: "index_forem_topics_on_user_id", using: :btree

  create_table "forem_views", force: true do |t|
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count",             default: 0
    t.string   "viewable_type"
    t.datetime "current_viewed_at"
    t.datetime "past_viewed_at"
  end

  add_index "forem_views", ["updated_at"], name: "index_forem_views_on_updated_at", using: :btree
  add_index "forem_views", ["user_id"], name: "index_forem_views_on_user_id", using: :btree
  add_index "forem_views", ["viewable_id"], name: "index_forem_views_on_viewable_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "image"
    t.integer  "parent_id"
    t.string   "parent_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "invoices", force: true do |t|
    t.integer  "car_wash_id"
    t.string   "address"
    t.string   "title"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "inn"
  end

  create_table "messages", force: true do |t|
    t.integer  "sender_id",                   null: false
    t.integer  "receiver_id",                 null: false
    t.string   "subject",                     null: false
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_wash_id"
    t.boolean  "read",        default: false
  end

  add_index "messages", ["car_wash_id"], name: "index_messages_on_car_wash_id", using: :btree
  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree
  add_index "messages", ["sender_id"], name: "index_messages_on_sender_id", using: :btree

  create_table "navs", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "image_url"
    t.boolean  "hidden_xs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "remote"
    t.integer  "position"
  end

  create_table "normal_user_messages", force: true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.integer  "car_wash_id"
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.boolean  "read",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "normal_users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "name",                   default: "",               null: false
    t.string   "phone"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "pending_review"
    t.boolean  "forem_auto_subscribe",   default: false
  end

  add_index "normal_users", ["email"], name: "index_normal_users_on_email", unique: true, using: :btree
  add_index "normal_users", ["reset_password_token"], name: "index_normal_users_on_reset_password_token", unique: true, using: :btree

  create_table "operations", force: true do |t|
    t.integer "car_wash_id"
    t.decimal "value",          precision: 10, scale: 2
    t.string  "transaction_id"
  end

  create_table "payments", force: true do |t|
    t.boolean  "confirmed",   default: false
    t.boolean  "verified",    default: false
    t.boolean  "failed",      default: true
    t.integer  "car_wash_id"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_categories", force: true do |t|
    t.string "name"
    t.string "type"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.datetime "published_at"
    t.boolean  "published"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "post_category_id"
  end

  add_index "posts", ["type"], name: "index_posts_on_type", using: :btree

  create_table "requests", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.text     "text"
    t.integer  "car_wash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "read",        default: false
  end

  create_table "reviews", force: true do |t|
    t.string   "text"
    t.integer  "rating"
    t.integer  "car_wash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "created_by"
    t.string   "user_name"
  end

  add_index "reviews", ["car_wash_id"], name: "index_reviews_on_car_wash_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles_users", ["role_id"], name: "index_roles_users_on_role_id", using: :btree
  add_index "roles_users", ["user_id"], name: "index_roles_users_on_user_id", using: :btree

  create_table "services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "settings", force: true do |t|
    t.string   "app_name"
    t.string   "ad_1_title"
    t.string   "ad_1_text"
    t.string   "ad_2_title"
    t.string   "ad_2_text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mq_message"
    t.string   "cl_message_0_text"
    t.string   "cl_message_0_url"
    t.string   "cl_message_1_text"
    t.string   "cl_message_1_url"
    t.string   "cl_message_2_text"
    t.string   "cl_message_2_url"
    t.string   "cl_message_3_text"
    t.string   "cl_message_3_url"
    t.string   "cl_message_4_text"
    t.string   "cl_message_4_url"
    t.string   "cl_message_5_text"
    t.string   "cl_message_5_url"
    t.string   "ad_1_url"
    t.string   "ad_2_url"
  end

  add_index "settings", ["app_name"], name: "index_settings_on_app_name", unique: true, using: :btree

  create_table "static_pages", force: true do |t|
    t.string   "title"
    t.text     "header"
    t.text     "content"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribes", force: true do |t|
    t.integer  "normal_user_id"
    t.integer  "car_wash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscribes", ["car_wash_id"], name: "index_subscribes_on_car_wash_id", using: :btree
  add_index "subscribes", ["normal_user_id"], name: "index_subscribes_on_normal_user_id", using: :btree

  create_table "survey_results", force: true do |t|
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_id"
    t.integer  "result"
  end

  add_index "survey_results", ["survey_id"], name: "index_survey_results_on_survey_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",               null: false
    t.string   "encrypted_password",     default: "",               null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_wash_id"
    t.string   "phone"
    t.string   "contact_person"
    t.string   "car_wash_title"
    t.string   "address"
    t.datetime "valid_to"
    t.boolean  "forem_admin",            default: false
    t.string   "forem_state",            default: "approved"
    t.boolean  "forem_auto_subscribe",   default: false
    t.string   "name",                   default: "",               null: false
    t.string   "type",                   default: "car_wash_owner", null: false
    t.string   "nickname"
    t.string   "provider"
    t.string   "url"
    t.string   "social_id"
  end

  add_index "users", ["car_wash_id"], name: "index_users_on_car_wash_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "url"
    t.integer  "car_wash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  add_index "videos", ["car_wash_id"], name: "index_videos_on_car_wash_id", using: :btree

end
