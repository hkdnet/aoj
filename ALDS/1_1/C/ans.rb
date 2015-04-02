require 'prime'
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
    n = geti
    @nums = (1..n).map { geti }
  end

  def solve
    puts @nums.count { |e| Prime.prime?(e) }
  end
end

s = Solver.new
s.solve
