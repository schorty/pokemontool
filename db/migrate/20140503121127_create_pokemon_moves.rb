class CreatePokemonMoves < ActiveRecord::Migration
  def change
    create_table :pokemon_moves do |t|
      t.integer :pokemon_id
      t.integer :move_id
      t.integer :learn_method
      t.integer :level

      t.timestamps
    end
  end
end
