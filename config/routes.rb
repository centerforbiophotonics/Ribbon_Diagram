Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'

  devise_for :users, controllers: { confirmations: "users/confirmations" }

  devise_scope :user do
    authenticated :user do
      # Rails 4 users must specify the 'as' option to give it a unique name
      root :to => "diagrams#index", :as => :authenticated_root
    end

    unauthenticated :user do
      root :to => 'devise/sessions#new'
    end
  end

  resources :reports, :only => [:index]

  resources :diagrams do
    member do
      get 'download'
    end
  end

  resources :users

  resources :institutions
end
