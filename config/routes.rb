Rails.application.routes.draw do
  get 'dashboard/index'
  get 'home/index'
  devise_for :users, path: 'auth',controllers: { registrations: :custom_registrations} , path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  # get 'contacts/index', as: 'contacts'
  # get 'contacts/new', as: 'new_contact'
  # post 'contacts/create', as: 'create_contact'
  # get 'contacts/:id/edit', to: 'contacts#edit', as: 'edit_contact'
  # patch 'contacts/:id/update', to: 'contacts#update', as: 'update_contact'
  # delete 'contacts/:id/destroy', to: 'contacts#destroy', as: 'destroy_contact_path'
  resources :contacts, except: [:show] do
    get 'autocomplete', on: :collection
  end
  post '/groups', to: 'groups#create'
  get '/dashboard', to: 'dashboard#index'
  root 'home#index'
end
