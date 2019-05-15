Rails.application.routes.draw do
  resources :folios, except: [:show]
  get 'folio/:id', to: 'folios#show', as: 'folio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
