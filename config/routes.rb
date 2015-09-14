Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  devise_for :users
  root to: 'pages#dashboard'
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
    resources :rfqs do
      get :delegation_summary, on: :collection
      get :final_approval, on: :collection
      get :display_full_info, on: :collection
      get :rfq_delivery_lists, on: :collection
      get :rfq_item_delivery, on: :collection
      get :rfq_disbursement_account, on: :collection
      get :rfq_anchorage_billings, on: :collection
    end
    resources :rfq_items do
      get :choose_rfq_supplier, on: :collection
      get :update_selected_supplier, on: :collection
      get :view_rfq_supplier, on: :collection
      get :approved_supplier, on: :collection
      get :disapproved_supplier, on: :collection
    end
    resources :rfq_supplier_items
    resources :logreqs do
      get :ship_listings, on: :collection
      get :display_data, on: :collection
      get :delivery_reports, on: :collection
      get :delivery_lists, on: :collection
      get :disbursement_account, on: :collection
      get :anchorage_billings, on: :collection
      get :approved_logreq, on: :collection
      get :view_logreq, on: :collection
      # get :assigned_user_breakdown_services, on: :collection
      # get :assigned_user_breakdown_service_form, on: :collection
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
    resources :purchase_orders do
      get :rfq_build_po, on: :collection
      get :list_rfq_build_po, on: :collection
      get :rfq_purchase_order, on: :collection
      get :create_rfq_po, on: :collection
      get :rfq_edit, on: :collection

    end
    resources :purchase_order_items
    resources :supplier_pricing_details
    resources :purchasing_orders
    resources :drivers
    resources :employers
  end

  #independent pages
  get 'pages/dashboard', :as => 'dashboard'

  #ajax call
  get 'pages/change_subcategory', :as => 'change_subcategory'
  get 'pages/change_item', :as => 'change_item'
  get 'pages/list_supplier_items_per_price', :as => 'list_supplier_items_per_price'
  get 'api/incidental_items/list_supplier_per_items', :as => 'list_supplier_per_items'
  get 'pages/list_principal_info', :as => 'list_principal_info'
end
