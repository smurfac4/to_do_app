Rails.application.routes.draw do
  resources :tasks, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
  get "items/index"
  get "up" => "rails/health#show", as: :rails_health_check
end