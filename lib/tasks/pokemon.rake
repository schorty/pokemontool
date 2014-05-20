require 'csv'

namespace :pokemon do
  desc 'Gotta catch em all!'
  task create_pokemon: :environment do

    puts 'Start creating Pokemon'
    csv_text = File.read('lib/assets/pokemon_names.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if Pokemon.create!(id: row[:id], name: row[:name]) 
        puts "#{row[:name]} created!"
      else
        puts "#{row[:name]} not created!"
      end
    end
  end

  desc 'Gotta train em all!'
  task update_pokemon_base_stats: :environment do
    puts 'Start inserting pokemon base stats'

    csv_text = File.read('lib/assets/pokemon_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if pokemon = Pokemon.find(row[:pokemon_id])
        pokemon.hp_base = row[:hp].to_i
        pokemon.attack_base = row[:attack].to_i
        pokemon.defense_base = row[:defense].to_i
        pokemon.special_attack_base = row[:special_attack].to_i
        pokemon.special_defense_base = row[:special_defense].to_i
        pokemon.speed_base = row[:speed].to_i

        if pokemon.save!
          puts "#{pokemon.name} updated"
        else
          puts "Unable to update Pokemon with id #{row[:pokemon_id]}"
        end
      else
        puts "Pokemon with ID #{row[:pokemon_id]} not found!"
      end
    end
  end

  desc 'Give em types!'
  task create_pokemon_types: :environment do
    puts 'Start inserting pokemon types'

    csv_text = File.read('lib/assets/pokemon_types.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if PokemonType.create!(pokemon_id: row[:pokemon_id], type_id: row[:type_id]) 
        puts "#{row[:pokemon_id]} created!"
      else
        puts "#{row[:pokemon_id]} not created!"
      end
    end
  end
end