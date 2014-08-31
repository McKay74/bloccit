Bloccit::Application.routes.draw do
  get 'comments/create'

  # get 'topics/index'

  # get 'topics/new'

  # get 'topics/show'

  # get 'topics/edit'

  devise_for :users

  resources :users, only: [:update]

  resources :topics do 
    resources :posts, except: [:index] do
      resources :comments, only: [:create, :destroy]   #comments checkpoint
    end
  end


  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
