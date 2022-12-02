Rails.application.routes.draw do
  resources :toys, only: [:index, :show, :create, :update, :destroy]
  patch "/toys/:id/like", to: "toys#increment_likes"
end
