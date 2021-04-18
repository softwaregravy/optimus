Rails.application.routes.draw do
  resources :person_applications
  get 'treasury_prime/ping'
  get 'treasury_prime/accounts'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
