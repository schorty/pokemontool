namespace :effects do
  desc "Creates the effects"
  task create_effects: :environment do
    Effect.delete_all

    Type.all.each do |defender| 
      Type.all.each do |attacker|
        factor = 1.0

        case defender.name
        when 'Normal'
          case attacker.name
          when 'Ghost'
            factor = 0.0
          when 'Fighting'
            factor = 2.0
          end
        when 'Fire'
          case attacker.name
          when 'Fire', 'Steel', 'Grass', 'Ice', 'Bug', 'Fairy'
            factor = 0.5
          when 'Water', 'Rock', 'Ground'
            factor = 2.0
          end
        when 'Water'
          case attacker.name
          when 'Water', 'Fire', 'Ice', 'Steel'
            factor = 0.5
          when 'Electric', 'Grass'
            factor = 2.0
          end
        when 'Electric'
          case attacker.name
          when 'Electric', 'Flying', 'Steel'
            factor = 0.5
          when 'Ground'
            factor = 2.0
          end
        when 'Grass'
          case attacker.name
          when 'Water', 'Grass', 'Electric', 'Ground'
            factor = 0.5
          when 'Fire', 'Poison', 'Flying', 'Bug', 'Ice'
            factor = 2.0
          end
        when 'Ice'
          case attacker.name
          when 'Ice'
            factor = 0.5
          when 'Fire', 'Steel', 'Rock', 'Fighting'
            factor = 2.0
          end
        when 'Fighting'
          case attacker.name
          when 'Rock', 'Bug', 'Dark'
            factor = 0.5
          when 'Flying', 'Psychic', 'Fairy'
            factor = 2.0
          end
        when 'Poison'
          case attacker.name
          when 'Poison', 'Grass', 'Fight', 'Bug', 'Fairy'
            factor = 0.5
          when 'Psychic', 'Ground'
            factor = 2.0
          end
        when 'Ground'
          case attacker.name
          when 'Electric'
            factor = 0.0
          when 'Poison', 'Rock'
            factor = 0.5
          when 'Grass', 'Water', 'Ice'
            factor = 2.0
          end
        when 'Flying'
          case attacker.name
          when 'Ground'
            factor = 0.0
          when 'Grass', 'Fighting', 'Bug'
            factor = 0.5
          when 'Rock', 'Electric', 'Ice'
            factor = 2.0
          end
        when 'Psychic'
          case attacker.name
          when 'Psychic', 'Fighting'
            factor = 0.5
          when 'Dark', 'Bug', 'Ghost'
            factor = 2.0
          end
        when 'Bug'
          case attacker.name
          when 'Grass', 'Fighting', 'Ground'
            factor = 0.5
          when 'Rock', 'Fire', 'Flying'
            factor = 2.0
          end
        when 'Rock'
          case attacker.name
          when 'Normal', 'Fire', 'Poison', 'Flying'
            factor = 0.5
          when 'Ice', 'Water', 'Grass', 'Ground'
            factor = 2.0
          end
        when 'Ghost'
          case attacker.name
          when 'Normal', 'Fighting'
            factor = 0.0
          when 'Bug', 'Poison'
            factor = 0.5
          when 'Dark', 'Ghost'
            factor = 2.0
          end
        when 'Dragon'
          case attacker.name
          when 'Fire', 'Water', 'Electric', 'Grass'
            factor = 0.5
          when 'Dragon', 'Ice', 'Fairy'
            factor = 2.0
          end
        when 'Dark'
          case attacker.name
          when 'Psychic'
            factor = 0.0
          when 'Dark', 'Ghost'
            factor = 0.5
          when 'Bug', 'Fighting', 'Fairy'
            factor = 2.0
          end
        when 'Steel'
          case attacker.name
          when 'Poison'
            factor = 0.0
          when 'Water', 'Electric', 'Ghost', 'Dark'
            factor = 1.0
          when 'Ground', 'Fighting', 'Fire'
            factor = 2.0
          else
            factor = 0.5
          end
        when 'Fairy'
          case attacker.name
          when 'Dragon'
            factor = 0.0
          when 'Dark', 'Fighting', 'Bug'
            factor = 0.5
          when 'Steel', 'Poison'
            factor = 2.0
          end
        end
        eff = defender.effects.build(attacker_type: attacker.name, factor: factor)
        
        if eff.save
          puts "#{attacker.name} -> #{defender.name} created"
        else 
          puts "#{attacker.name} -> #{defender.name} could not be created"
        end
      end
    end
  end
end