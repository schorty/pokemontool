Pokemontool::Application.routes.draw do
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
