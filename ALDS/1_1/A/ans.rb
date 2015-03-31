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
  end

  def solve
    (1...@n).each do |i|
      show
      i.downto(1).each do |j|
        break if @nums[j - 1] <= @nums[j]
        exchange_with_prev(j)
      end
    end
    show
  end

  private

  def show
    puts @nums.join(' ')
  end

  def exchange_with_prev(idx)
    @nums[idx - 1], @nums[idx] = [@nums[idx], @nums[idx - 1]]
  end

  def swap(a, b)
    [b, a]
  end
end

s = Solver.new
s.solve
