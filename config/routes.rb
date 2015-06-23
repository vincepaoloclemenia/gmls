Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  root to: 'api/locations#index'
  namespace :api do
    resources :locations
    resources :roles
    resources :employees
    resources :tools
    resources :quality_questionnaires
    resources :categories
    resources :sub_categories
    resources :items
    resources :item_location_prices
    resources :item_prices
    resources :vessel_classes
    resources :vessel_types
    resources :users do
      get :display_data, on: :collection
    end
    get :csrf, to: 'csrf#index'
    resources :vessels
    resources :vehicles
    resources :principals  
    resources :suppliers
    resources :supplier_items
    resources :supplier_categories
    resources :services
    resources :service_providers
    resources :ship_arrivals
    resources :government_agencies
    resources :prepservices
    resources :rfqs
    resources :rfq_items
    resources :rfq_supplier_items
    resources :logreqs do
      get :ship_listings, on: :collection
      get :display_data, on: :collection
    end
    resources :archives
    resources :navy_types
    resources :incidental_quotes do 
      get :display_data, on: :collection 
    end
    resources :incidental_items
    resources :contracts
    resources :contract_items
    resources :role_managements
    resources :logreq_responses
    resources :purchase_orders
    resources :purchase_order_items
  end
end
