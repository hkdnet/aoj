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
    puts @a.gcd(@b)
  end
end

s = Solver.new
s.solve
