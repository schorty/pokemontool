require 'csv'

namespace :pokemon do
  desc 'Gotta catch em all!'
  task insert_pokemon: :environment do
    puts 'Start creating Pokemon'
    csv_text = File.read('lib/assets/pokemon_names.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if row[:local_language_id] == '6'
        Pokemon.create!(name: row[:name]) 
        puts "#{row[:name]} created!"
      else
        puts "#{row[:name]} not created!"
      end
    end

    puts 'Start inserting pokemons base stats'

    csv_text = File.read('lib/assets/pokemon_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if pokemon = Pokemon.find(row[:pokemon_id])
        Pokemon.create!(name: row[:name]) 
        puts "#{row[:name]} created!"
      else
        puts "#{row[:name]} not created!"
      end
    end
  end
end