Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/directors', to: 'directors#index'
  post '/directors', to: 'directors#create'
  get '/directors/new', to: 'directors#new'
  get '/directors/:id/edit', to: 'directors#edit'
  get '/directors/:id', to: 'directors#show'
  patch '/directors/:id', to: 'directors#update'
  
  get '/films', to: 'films#index'
  post '/films', to: 'films#create'
  get '/films/new', to: 'films#new'
  get '/films/:id/edit', to: 'films#edit'
  get '/films/:id', to: 'films#show'
  patch '/films/:id', to: 'films#update'
  
  get '/directors/:id/films', to: 'director_films#index'
end
