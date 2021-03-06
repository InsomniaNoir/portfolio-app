Rails.application.routes.draw do
  resources :topics, only: [:index, :show]

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  
  resources :folios, except: [:show] do
    put :sort, on: :collection
  end

  get 'folio/:id', to: 'folios#show', as: 'folio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'my-tweets', to: 'pages#my_tweets'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
