class TeamMembership < ActiveRecord::Base
  belongs_to :team
  belongs_to :pokemon

  validates_associated :team
  validate :evs_present
  validate :each_ev_in_bound
  validate :evs_in_bound
  validate :ivs_present
  validate :each_iv_in_bound

  private

  def evs_present
    return if ev_hp && ev_attack && ev_defense && ev_special_attack && ev_special_defense && ev_speed
    errors[:ev] << "Alle EVs müssen zahlen sein!"
  end

  def each_ev_in_bound
    values = [ev_hp, ev_attack, ev_defense, ev_special_attack, ev_special_defense, ev_speed]
    maximum = values.max
    minimum = values.min
    return if maximum <= 255 && minimum >= 0

    errors[:ev_hp]              << "Es dürfen maximal 255 EVs auf einen Statuswert verteilt werden!" if ev_hp > 255
    errors[:ev_attack]          << "Es dürfen maximal 255 EVs auf einen Statuswert verteilt werden!" if ev_hp > 255
    errors[:ev_defense]         << "Es dürfen maximal 255 EVs auf einen Statuswert verteilt werden!" if ev_hp > 255
    errors[:ev_special_attack]  << "Es dürfen maximal 255 EVs auf einen Statuswert verteilt werden!" if ev_hp > 255
    errors[:ev_special_defense] << "Es dürfen maximal 255 EVs auf einen Statuswert verteilt werden!" if ev_hp > 255
    errors[:ev_speed]           << "Es dürfen maximal 255 EVs auf einen Statuswert verteilt werden!" if ev_hp > 255
  end

  def evs_in_bound
    ev_sum = ev_hp + ev_attack + ev_defense + ev_special_attack + ev_special_defense + ev_speed

    return if ev_sum <= 510
    errors[:ev] << "Zu viele EVs verteilt!"
  end

  def ivs_present
    return if iv_hp && iv_attack && iv_defense && iv_special_attack && iv_special_defense && iv_speed
    errors[:iv] << "Alle IVs müssen zahlen sein!"
  end

  def each_iv_in_bound
    values = [iv_hp, iv_attack, iv_defense, iv_special_attack, iv_special_defense, iv_speed]
    maximum = values.max
    minimum = values.min
    return if maximum <= 31 && minimum >= 0

    errors[:iv_hp]              << "Es dürfen maximal 255 IVs auf einen Statuswert verteilt werden!" if iv_hp > 255
    errors[:iv_attack]          << "Es dürfen maximal 255 IVs auf einen Statuswert verteilt werden!" if iv_hp > 255
    errors[:iv_defense]         << "Es dürfen maximal 255 IVs auf einen Statuswert verteilt werden!" if iv_hp > 255
    errors[:iv_special_attack]  << "Es dürfen maximal 255 IVs auf einen Statuswert verteilt werden!" if iv_hp > 255
    errors[:iv_special_defense] << "Es dürfen maximal 255 IVs auf einen Statuswert verteilt werden!" if iv_hp > 255
    errors[:iv_speed]           << "Es dürfen maximal 255 IVs auf einen Statuswert verteilt werden!" if iv_hp > 255
  end
end
