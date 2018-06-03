Rails.application.routes.draw do
  root 'contacts#index'
  get 'contacts/index'
end
