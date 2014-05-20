namespace :converter do
  desc "Creates the effects"
  task convert: :environment do
    require 'csv'

    type_id = {
      "type_id" => "type_id",
      1 => 1,
      2 => 7,
      3 => 10,
      4 => 8,
      5 => 9,
      6 => 13,
      7 => 12,
      8 => 14,
      9 => 17,
      10 => 2,
      11 => 3,
      12 => 5,
      13 => 4,
      14 => 11,
      15 => 6,
      16 => 15,
      17 => 16,
      18 => 18
    }

    pokemon_data  = CSV.parse(File.read('lib/assets/pokemon_types.csv')).to_a

    CSV.open("lib/assets/new_pokemon_types.csv", "wb") do |csv|
      pokemon_data.each do |row|
        csv << [row[0], type_id[row[1].to_i]]
      end
    end
  end
end

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