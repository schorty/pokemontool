namespace :moves do
  desc "Pikachu! Use thunder shock!"
  task create_moves: :environment do
    puts 'Start creating moves'
    csv_text = File.read('lib/assets/moves.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      if Move.create!(id: row[:id], name: row[:name], type_id: row[:type_id], power: row[:power], pp: row[:pp], accuracy: row[:accuracy], priority: row[:priority], damage_class: row[:damage_class_id]) 
        puts "#{row[:name]} created!"
      else
        puts "#{row[:name]} not created!"
      end
    end
  end  

  desc "Insert power to moves, because i forgot them *rolleyes*"
  task add_power: :environment do
    puts 'Start updating moves'
    csv_text = File.read('lib/assets/moves.csv')
    csv = CSV.parse(csv_text, :headers => true)
    
    csv.each do |row|
      row = row.to_hash.symbolize_keys!

      m = Move.find(row[:id]) 
      m.power = row[:power]

      if m.save!
        puts "#{row[:name]} updated!"
      else
        puts "#{row[:name]} not updated!"
      end
    end
  end

  task create_pokemon_moves: :environment do
    puts 'Start creating pokemon moves'
    csv_text = File.read('lib/assets/pokemon_moves.csv')
    csv = CSV.parse(csv_text, :headers => true)
    counter = 0

    enums_for_learn_method = [
      'Level',
      'Vererbung',
      'Attackenhelfer',
      'TM/VM'
    ]

    csv.each do |row|
      row = row.to_hash

      PokemonMove.create!(pokemon_id: row["pokemon_id"], move_id: row["move_id"], learn_method: enums_for_learn_method[row["learn_method_id"].to_i - 1], level: row["level"]) 
      counter += 1

      if counter % 1000 == 0
        p counter
      end
    end
  end
end
