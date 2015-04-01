#
# alias for Programming Contest
#
module Input
  def geti
    gets.chomp.to_i
  end

  def getis
    gets.chomp.split.map(&:to_i)
  end
end

#
# main logic which has only one public method Solver#solve
#
class Solver
  include Input

  def initialize
    @a, @b = getis
  end

  def solve
    while @a * @b != 0
      @a, @b = [@a, @b].minmax
      @b = @b % @a
    end
    puts [@a, @b].max
  end
end

s = Solver.new
s.solve
