Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    resources :orders, only: [:show, :update]
    get "/" => "homes#top"
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :order_details, only: [:update]
  end

   scope module: :public do
    root:to => "homes#top"
    get "/about" => "homes#about"
    resources :shipping_addresses, except: [:new, :show]
    resource :customers, only: [:show, :edit, :update]
    get "/customers/unsubscribe" => "customers#unsubscribe"
    patch "/customers/withdrawa" => "customers#withdrawa"
     get "/orders/thanx" => "orders#thanx"
    resources :orders, only: [:new, :create, :index, :show]
    post "/orders/log" => "orders#log"
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :items, only: [:index, :show]


  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
