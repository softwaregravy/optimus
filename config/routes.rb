Rails.application.routes.draw do
  get 'checking_account(/:id)', to: 'checking_account#show', as: 'checking_account'
  get 'checking_account/details(/:id)', to: 'checking_account#details', as: 'checking_account_details'
  root to: 'treasury_prime#ping'
  resources :person_applications 
  get 'person_applications/apply_for_chequing(/:id)', to: 'person_applications#apply_for_chequing', as: 'apply_for_chequing'
  get 'treasury_prime/ping'
  get 'treasury_prime/accounts'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
