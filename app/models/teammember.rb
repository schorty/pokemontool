class Teammember
  attr_accessor :type1, :type2

  def initialize(types)
    raise StandardError.new('The teammember needs a type!') if types.empty?
    types = [types] unless types.kind_of?(Array)

    if (types[0] != 'None')
      @type1 = Type.find_by(name: types[0]) 
    else
      @type1 = { name: 'None' }
    end
    if types.length > 1
      if (types[1] != 'None')
        @type2 = Type.find_by(name: types[1])
      else
        @type2 = { name: 'None' }
      end
    end
  end

  def calc_defense_factors
    if @type1[:name] == 'None'
      factors = []
      18.times { |_| factors << 1.0 }
      return factors
    end

    factors = @type1.effects.pluck(:factor)

    if dualtype?
      secondary_factors = @type2.effects.pluck(:factor)
      factors.map! do |factor|
        factor = factor.to_f * secondary_factors.shift.to_f
      end
    end

    factors
  end

  def print
    if @type1 
      return_value = @type1[:name]
    else
      return_value = '-'
    end
    return_value = return_value + " / " + @type2[:name] if @type2
    return_value
  end

  private

  def dualtype?
    return !type2.nil?
  end
end