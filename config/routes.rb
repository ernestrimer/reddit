Rails.application.routes.draw do
  root 'subs#index'
  # get 'sub/index'
  # get 'sub/edit'
  # get 'sub/show'
  # get 'sub/new'
  # post 'sub/create'
  resources :subs do
    resources :topics  
      # bad practice
      # resources :comments do
      #   resources :likes
      # end
    # '/subs/:sub_id/topics'
    # /subs/1/topics
    # /subs/:sub_id/topics/:id
    # /subs/2/topics/1
  end
  resources :topics do
    resources :comments
  end
  # resources :pictures
  # http verb  'url pattern', to: 'controller#action'
    #  :id   placeholder for id 
    # get '/people', to: 'people#index'
    # "/subs/3"
end
