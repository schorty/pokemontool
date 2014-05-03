namespace :moves do
  desc "Pikachu! Use thunder shock!"
  task create_moves: :environment do
    puts 'Start creating moves'
    csv_text = File.read('lib/assets/moves.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if Move.create!(id: row[:id], name: row[:name],type_id: row[:type_id], pp: row[:pp], accuracy: row[:accuracy], priority: row[:priority], damage_class: row[:damage_class_id]) 
        puts "#{row[:name]} created!"
      else
        puts "#{row[:name]} not created!"
      end
    end
  end  

  task create_pokemon_moves: :environment do
    puts 'Start creating pokemon moves'
    csv_text = File.read('lib/assets/pokemon_moves.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash

      PokemonMove.create!(pokemon_id: row["pokemon_id"], move_id: row["move_id"], learn_method: row["learn_method_id"], level: row["level"]) 
    end
  end
end
