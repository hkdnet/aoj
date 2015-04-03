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
      (@n - 1).downto(i + 1) do |j|
        nums_swap_at(j) if @nums[j] < @nums[j - 1]
      end
    end

    puts @nums.join(' ')
    puts @count
  end

  def nums_swap_at(idx)
    @nums[idx - 1], @nums[idx] = [@nums[idx], @nums[idx - 1]]
    @count += 1
  end
end

s = Solver.new
s.solve
