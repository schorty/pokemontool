namespace :converter do
  desc "Creates the effects"
  task convert: :environment do
    require 'csv'

    move_meta  = CSV.parse(File.read('lib/assets/move_meta.csv'))
    move_names = CSV.parse(File.read('lib/assets/move_names.csv'))

    CSV.open("lib/assets/pokemon_moves_merged.csv", "wb") do |csv|
      binding.pry
    end
  end
end