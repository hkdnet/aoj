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
    greatest_diff = @nums[1] - @nums[0]
    min = @nums[0, 2].min
    @nums.drop(2).each do |rj|
      greatest_diff = rj - min if greatest_diff < rj - min
      min = rj if rj < min
    end
    puts greatest_diff
  end
end

s = Solver.new
s.solve
