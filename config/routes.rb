Rails.application.routes.draw do
  root 'contacts#index'
  get 'contacts/index', as: 'contacts'
end
