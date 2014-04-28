class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :hp_base
      t.integer :attack_base
      t.integer :defense_base
      t.integer :special_attack_base
      t.integer :special_defense_base
      t.integer :speed_base

      t.timestamps
    end
  end
end
