Rails.application.routes.draw do
  # Ваши текущие маршруты
  resources :tasks, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
  
  get "items/index"
  get "up" => "rails/health#show", as: :rails_health_check

  # --- ДОБАВЬТЕ ЭТОТ БЛОК ДЛЯ АДМИНКИ ---
  namespace :admin do
    # Главная страница админки (admin_dashboard_path)
    get "/", to: "dashboard#index", as: :dashboard
    
    # Маршруты для управления пользователями, организациями и т.д.
    resources :users
    resources :organizations
    resources :integrations
    resources :audit_logs
  end
  # --------------------------------------
end