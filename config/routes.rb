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
      get :delivery_reports, on: :collection
      get :delivery_lists, on: :collection
      get :disbursement_account, on: :collection
      get :anchorage_billings, on: :collection
    end
    resources :archives
    resources :navy_types
    resources :incidental_quotes do 
      get :manage_services, on: :collection
      get :display_data, on: :collection 
      get :approved, on: :collection
      get :services_breakdown, on: :collection 
    end
    resources :incidental_items do
      get :choose_supplier, on: :collection
      get :update_supplier, on: :collection
      get :choose_supplier_listings, on: :collection
      get :build_purchase_order, on: :collection
      get :autocomplete_item_name, :on => :collection
      get :select_incidental_items, :on => :collection
      get :include_incidental_item, :on => :collection
      get :exclude_incidental_item, :on => :collection
      # get :list_supplier_per_items, on: :collection
    end
    resources :contracts
    resources :contract_items
    resources :role_managements
    resources :logreq_responses
    resources :purchase_orders
    resources :purchase_order_items
    resources :supplier_pricing_details
    resources :purchasing_orders
    resources :drivers
    resources :employers
  end
  #ajax call
  get 'pages/change_subcategory', :as => 'change_subcategory'
  get 'pages/list_supplier_items_per_price', :as => 'list_supplier_items_per_price'
  get 'api/incidental_items/list_supplier_per_items', :as => 'list_supplier_per_items'
end
