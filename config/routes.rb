Pokemontool::Application.routes.draw do
  get "move/index"
  get "move/show"
  get "pokemon_move/index"
  get "pokemon_move/show"

  resources :pokemon, only: [:show, :index] do
    member do
      resources :move, only: [:show, :index]
    end
  end

  resources :moves, only: [:show, :index]


  get "damage/calc"
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
