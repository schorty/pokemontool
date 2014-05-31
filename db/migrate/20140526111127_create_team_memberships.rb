class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.integer :team_id
      t.integer :pokemon_id

      t.integer :level

      t.integer :ev_hp
      t.integer :ev_attack
      t.integer :ev_defense
      t.integer :ev_special_attack
      t.integer :ev_special_defense
      t.integer :ev_speed      

      t.integer :iv_hp
      t.integer :iv_attack
      t.integer :iv_defense
      t.integer :iv_special_attack
      t.integer :iv_special_defense
      t.integer :iv_speed

      t.integer :attack_1
      t.integer :attack_2
      t.integer :attack_3
      t.integer :attack_4

      t.timestamps
    end
  end
end
