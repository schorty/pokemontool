namespace :converter do
  desc "Creates the effects"
  task convert: :environment do
    require 'csv'

    pokemon_moves  = CSV.parse(File.read('lib/assets/pokemon_moves.csv')).to_a

    CSV.open("lib/assets/new_pokemon_moves.csv", "wb") do |csv|
      pokemon_moves.each do |row|
        if row[1].to_i == 15
          csv << [row[0], row[2], row[3], row[4]]
        end
      end
    end
  end
end

# 0 pokemon_id
# 1 version_group_id
# 2 move_id
# 3 pokemon_move_method_id
# 4 level
# 5 order

# type_id = {
#   "type_id" => "type_id",
#   1 => 1,
#   2 => 7,
#   3 => 10,
#   4 => 8,
#   5 => 9,
#   6 => 13,
#   7 => 12,
#   8 => 14,
#   9 => 17,
#   10 => 2,
#   11 => 3,
#   12 => 5,
#   13 => 4,
#   14 => 11,
#   15 => 6,
#   16 => 15,
#   17 => 16,
#   18 => 18
# }