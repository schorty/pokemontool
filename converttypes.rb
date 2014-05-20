

































require 'csv'

TYPES = {
  1 => , #normal
  2 => , #fire
  3 => , #water
  4 => , #electric
  5 => , #grass
  6 => , #ice
  7 => , #fighting
  8 => , #poison
  9 => , #ground
  10 => ,#flying
  11 => ,
  12 => ,
  13 => ,
  14 => ,
  15 => ,
  16 => ,
  17 => ,
  18 => ,
}

CSV.foreach(File.path("pokemon_types.csv")) do |col|
  p col
end