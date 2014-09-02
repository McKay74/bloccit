Bloccit::Application.routes.draw do
  get 'comments/create'

  # get 'topics/index'

  # get 'topics/new'

  # get 'topics/show'

  # get 'topics/edit'

  devise_for :users

  resources :users, only: [:update]

    resources :topics do 
      resources :posts, except: [:index]
    end

    resources :posts, only: [] do
      resources :comments, only: [:create, :destroy] 
    end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
