Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cc_verification
  get 'delete' => 'cc_verification#delete'
  get 'download' => 'cc_verification#download'
  root 'cc_verification#index'
end
