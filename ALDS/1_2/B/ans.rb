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
    @n = geti
    @nums = getis
    @count = 0
  end

  def solve
    (0...@n).each do |i|
      mini = i
      (i...@n).each { |j| mini = j if @nums[j] < @nums[mini] }
      if i != mini
        @nums[i], @nums[mini] = [@nums[mini], @nums[i]]
        @count += 1
      end
    end
    puts @nums.join(' '), @count
  end
end

s = Solver.new
s.solve
