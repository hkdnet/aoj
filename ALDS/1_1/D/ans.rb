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
    min = @nums[0]
    greatest_diff = @nums[1] - @nums[0]
    @nums.drop(2).each do |r|
      greatest_diff = r - min if greatest_diff < r - min
      min = r if r < min
    end
    puts greatest_diff
  end
end

s = Solver.new
s.solve
