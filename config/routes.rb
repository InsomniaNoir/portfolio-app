Rails.application.routes.draw do
  resources :folios, except: [:show]
  get 'folio/:id', to: 'folios#show', as: 'folio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
