class DamageCalculator
  attr_accessor :max_damage, :max_damage_rel, :max_dmg_hp_left, :min_damage, :min_damage_rel, :min_dmg_hp_left
  STAGES = {
    '-6' => 0.25,
    '-5' => (2.0/7),
    '-4' => (2.0/6),
    '-3' => (2.0/5),
    '-2' => 0.5,
    '-1' => (2.0/3),
    '0'  => 1.0,
    '+1' => 1.5,
    '+2' => 2.0,
    '+3' => 2.5,
    '+4' => 3.0,
    '+5' => 3.5,
    '+6' => 4.0,
  }.freeze

  def initialize(factors)
    @level = factors.fetch(:level, 100.0).to_f
    @attack = factors.fetch(:attack, 1.0).to_f
    @defender_hp = factors.fetch(:hp, 100.0).to_f
    @defense = factors.fetch(:defense, 1.0).to_f
    @base_damage = factors.fetch(:base, 100.0).to_f
    @effectiveness = factors.fetch(:effectiveness, 1.0).to_f
    @item = factors.fetch(:item, 1.0).to_f
    @weather = factors.fetch(:weather, 1.0).to_f
    @ability = factors.fetch(:ability, 1.0).to_f
    if @ability != 2 #If not Adaptability
      @stab = factors.fetch(:stab, { checked: false }).fetch(:checked) == '1'
    else
      @stab = false
    end
    @attack_boosts = factors.fetch(:attack_boosts, "0")
    @defense_boosts = factors.fetch(:defense_boosts, "0")
    @crit = factors.fetch(:crit, { checked: false }).fetch(:checked) == '1'
    @factor = nil

    @max_damage = 0
    @max_damage_rel = 0
    @max_dmg_hp_left = 0
    @min_damage = 0
    @min_damage_rel = 0
    @min_dmg_hp_left = 0
  end

  def calc_damage
    @max_damage = (((2.0 * @level + 10.0) / 250.0 * (calc_attack / calc_defense) * @base_damage + 2.0) * calc_factor).to_i 
    @max_damage_rel = (@max_damage / @defender_hp * 100).round(1)
    @max_dmg_hp_left = (100 - @max_damage_rel).to_i
    @max_dmg_hp_left = 0 if @max_dmg_hp_left < 0

    @min_damage = (@max_damage * 0.85).to_i
    @min_damage_rel = (@min_damage / @defender_hp * 100).round(1)
    @min_dmg_hp_left = (100 - @min_damage_rel).to_i
    @min_dmg_hp_left = 0 if @min_dmg_hp_left < 0
  end



  private

  def calc_attack
    (@attack * DamageCalculator::STAGES[@attack_boosts]).to_f
  end

  def calc_defense
    (@defense * DamageCalculator::STAGES[@defense_boosts]).to_f
  end

  def calc_factor 
    if !@factor.nil?
      return @factor
    end

    factor = 1.0
    factor *= @effectiveness
    factor *= @item
    factor *= 1.5 if @crit
    factor *= 1.5 if @stab
    factor *= @ability
    factor *= @weather

    @factor = factor
    @factor
  end

  def negative?(num)
    num < 0
  end
end
