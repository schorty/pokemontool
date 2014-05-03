class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :power
      t.integer :type_id
      t.integer :pp
      t.integer :accuracy
      t.integer :priority
      t.integer :damage_class

      t.timestamps
    end
  end
end
