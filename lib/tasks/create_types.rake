namespace :types do
  desc "Creates the attackers"
  task create_types: :environment do
    Type.delete_all
    types = ['Normal', 'Fire', 'Water', 'Electric', 'Grass', 'Ice', 'Fighting', 'Poison', 'Ground', 'Flying', 'Psychic', 'Bug', 'Rock', 'Ghost', 'Dragon', 'Dark', 'Steel', 'Fairy']
    types.each do |type_name|
      type = Type.new(name: type_name)
      
      if type.save
        puts "type #{type.name} created"
      else
        puts "type #{type.name} could not be created"
      end
    end
  end
end
