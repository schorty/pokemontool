class Team
  attr_accessor :members, :type_matrix

  def initialize
    @members = []
    @type_matrix = []
  end

  def setup_type_matrix
    if @members.empty?
      return []
    end

    member_factors = @members.map { |m| [m.print] + m.calc_defense_factors }
    types = [{:name => ''}] + Type.all

    while !member_factors.first.empty?
      row = []
      member_factors.each do |m|
        row << m.shift
      end

      weaknesses = 0
      resistances = 0

      row.each do |column|
        if column.to_f > 1.0
          weaknesses += 1
        elsif column.to_f < 1.0
          resistances += 1
        end
      end
      type = types.shift
      row = [type[:name]] + row
      row << weaknesses 
      row << resistances

      @type_matrix << row
    end

    @type_matrix.first.pop(2)
    @type_matrix.first << 'Weaknesses'
    @type_matrix.first << 'Resistances'
  end
end