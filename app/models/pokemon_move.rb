class PokemonMove < ActiveRecord::Base
  enum learn_method: {
    'Level' => 1,
    'Vererbung' => 2,
    'Attackenhelfer' => 3,
    'TM/VM' => 4
  }

  belongs_to :pokemon
  belongs_to :move

  def method_to_html
    if self.learn_method == 'Level'
      "Level #{self.level}"
    else
      learn_method
    end
  end
end
