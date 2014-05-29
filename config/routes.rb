Pokemontool::Application.routes.draw do
  get "pokemon_move/index"
  get "pokemon_move/show"

  resources :pokemon, only: [:show, :index] do
    member do
      resources :pokemon_moves, only: [:show, :index]
    end
  end

  resources :teams do
    member do
      resources :team_memberships, only: [:new, :create, :edit, :update, :destroy]
    end
  end

  resources :moves

  get "typechart/show_chart"
  post "typechart/show_chart"

  get "typechart/show"
  get "typechart/index"
  
  get "typechart/chart"
  post "typechart/chart"
  
  get "damage/calc"
  post "damage/calc"

  post "damage/result"

  root 'typechart#index'
end
