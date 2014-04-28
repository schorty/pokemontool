class CreateEffects < ActiveRecord::Migration
  def change
    create_table :effects do |t|
      t.string :type_id
      t.string :attacker_type
      t.string :factor

      t.timestamps
    end
  end
end
