Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  root 'welcome#index'

  namespace :admin do
    resources :categories
    resources :products do
      member do
        patch :move_up
        patch :move_down
        post :hide
        post :publish
      end
    end

    resources :orders do
      member do
        post :cancel
        post :activate
        post :return
      end
     end

    resources :articles do
      member do
        post :publish
        post :hide
      end
    end
  end

  resources :products do
    resources :comments
    member do
      post :add_to_cart
      post :pay_now
      post :collect
      post :un_collect
    end
    collection do
      get :search
    end
  end

  resources :carts do
    collection do
      delete :clean
      get :checkout
    end
  end
  
  resources :cart_items do
    member do
      post :add_quantity
      post :remove_quantity
    end
  end

  resources :orders do
    member do
      post :pay_with_wechat
      post :pay_with_alipay
      post :apply_to_cancel
    end
  end

  namespace :account do
    resources :orders
    resources :products
    resources :users
  end

  resources :clubs do
    member do
      post :join
      post :quit
      post :upvote
    end
    collection do
      get :clubuser
    end
    resources :club_reviews
  end

  resources :articles do
    resources :article_reviews
    member do
      post :join
      post :quit
    end
  end


  # api
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :products do
        resources :comments
      end
      resources :carts do
        resources :cart_items
      end
      resources :orders do
        member do
          post :pay_with_wechat
          post :pay_with_alipay
        end
      end
      resources :clubs do
        member do
          post :join
          post :quit
          post :upvote
        end
        resources :club_reviews
      end
      resources :articles do
        member do
          post :join
          post :quit
        end
        resources :article_reviews
      end
    end
  end

end
