require 'csv'

namespace :pokemon do
  desc 'Gotta catch em all!'
  task insert_pokemon: :environment do
    Pokemon.delete_all

    puts 'Start creating Pokemon'
    csv_text = File.read('lib/assets/pokemon_names.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if row[:local_language_id] == '6'
        Pokemon.create!(id: pokemon_species_id, name: row[:name]) 
        puts "#{row[:name]} created!"
      else
        puts "#{row[:name]} not created!"
      end
    end
  end

  desc 'Gotta train em all!'
  task insert_base_stats: :environment do
    puts 'Start inserting pokemon base stats'

    csv_text = File.read('lib/assets/pokemon_stats.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if pokemon = Pokemon.find(row[:pokemon_id])
        case row[:stat_id]
        when 1
          pokemon.hp_base = row[:base_stat]
        when 2
          pokemon.attack_base = row[:base_stat]
        when 3
          pokemon.defense_base = row[:base_stat]
        when 4
          pokemon.special_attack_base = row[:base_stat]
        when 5
          pokemon.special_defense_base = row[:base_stat]
        when 6
          pokemon.speed_base = row[:base_stat]
        end

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
end