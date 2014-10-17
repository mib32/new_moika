Moika::Application.routes.draw do

  # Sorry
  get 'about', to: 'static_pages#show', permalink: 'new_about' 

  resources :images, only:[:update, :destroy]


  resources :survey_results, only: [:index,:create]
  namespace :admin do
    resources :surveys
  end

  get 'proposals', to: 'proposals#index'
  resources :reviews, only: [:index]

  # This line mounts Forem's routes at /forums by default.
  # This means, any requests to the /forums URL of your application will go to Forem::ForumsController#index.
  # If you would like to change where this extension is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Forem relies on it being the default of "forem"
  mount Forem::Engine, :at => '/forum'


  get 'news', to: 'posts#index', type: 'NewsPost'
  get 'info', to: 'posts#index', type: 'InfoPost'
  get 'video', to: 'video_posts#index'
  # get 'temp_session/login'
  resources :temp_session
  # resources :navs

  resources :posts, only: [:index,:show]
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  get "normal_users/show"
  root 'map#show'
  # get "map/show"

  get "sp/:id", to: "static_pages#show", as: "static_page"
  get "banners/update"

  get "user/:id", to: "users#show", as: '/user'
  get "users/registration", to: "users#registration", as: 'registration'
  get "users/login", to: "users#login", as: 'login'

  get "normal_user/:id", to: "normal_users#show", as: '/normal_user'

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions", :omniauth_callbacks => "users/omniauth_callbacks" }
  # devise_for :normal_users, controllers: { registrations: "registrations", sessions: "sessions" }

  get "update_password", to: "users#update_password", as: "/update_password"
  post "update_password", to: "users#update_password"
  # resource :user do
  #   collection do
  #     post 'update_password'
  #   end
  # end

  resources :car_washes do
    get :update_map, on: :collection
    # post :update_widget_of, on: :member
    resource :widget
    resources :comments, only: [:index, :create]
    resources :requests
    resources :messages, only: [:index, :show, :update]
    resources :normal_user_messages
    resources :banners, only: [:index, :update]
    resources :payments, only: [:index]
    resources :invoices, only: [:new, :create, :show]
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'
    resources :reviews
    resources :videos, except: [:index]
    resources :images, except: [:index]
  end
  get 'car_washes/:id/edit(/:cw_tabs_selected_tab)', :to => 'car_washes#edit', as: 'edit_car_wash_with_tab'
  # get 'car_washes/:id(/:cw_tabs_selected_tab)', :to => 'car_washes#show', as: 'show_car_wash_with_tab'
  put 'car_washes/:id/update_main_action', to: 'car_washes#update_main_action', as: '/car_washes_update_main_action'
  post 'car_washes/:id/subscribe/:user_id', to: 'car_washes#subscribe', as: '/car_washes_subscribe'

  controller :robokassa do
    get "robokassa/:notification_key/notify"   => :notify,  :as => :robokassa_notification

    get "robokassa/success"  => :success, :as => :robokassa_on_success
    get "robokassa/fail"     => :fail,    :as => :robokassa_on_fail
  end

  namespace :admin do
    get '', to: 'dashboard#main', as: '/'
    # get 'ads', to: 'settings#ads_index', as: 'ad_settings'
    # put 'ads', to: 'settings#ads_update'
    patch 'cube_ads', to: 'advertisements#update', :type => 'CubeAd'
    patch 'marquee_ads', to: 'advertisements#update', :type => 'MarqueeAd'
    resources :cube_ads, :controller => 'advertisements', :type => 'CubeAd'
    resources :marquee_ads, :controller => 'advertisements', :type => 'MarqueeAd'
    resources :ad_settings
    resources :mq_settings
    resources :settings
    get 'load_data_from_ya', to: 'dashboard#load_data_from_ya', as: '/load_data_from_ya'
    post 'users/create_admin'
    get 'users/new_admin'
    post 'users/destroy_admin'
    resources :users
    resources :messages, only: [:index, :show, :create, :destroy]
    resources :banners
    resources :banners_config, only: [:update]
    resources :static_pages
    resources :car_washes
    resources :posts
    resources :news_posts, :controller => 'posts', :type => 'NewsPost'
    resources :info_posts, :controller => 'posts', :type => 'InfoPost'
    resources :video_posts
    resources :post_categories
    resources :navs do
      post :update_position, on: :collection
    end 
    # devise_for :users, only: [:update, :index, :show]
    get 'add_car_wash/:id', to: 'users#add_car_wash', as: '/add_car_wash'
    delete 'delete_file/:id', to: 'banners#delete_file', as: '/delete_file'
  end
  match "*path" => redirect("/"), via: :all


end
