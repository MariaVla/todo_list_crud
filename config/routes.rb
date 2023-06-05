Rails.application.routes.draw do
  namespace :api do
    resources :todo_lists, only: %i[index show create update destroy], path: :todolists
    resources :todo_lists_items, only: %i[update destroy], path: :todolistsitems
  end

  resources :todo_lists, only: %i[index new], path: :todolists
end
