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
# Array expansion
#
class Array
  def insertion_sort(g)
    count = 0
    (g - 1...length).each do |i|
      v = self[i]
      j = i - g
      while j >= 0 && self[j] > v
        self[j + g] = self[j]
        j -= g
        count += 1
      end

      self[j + g] = v
    end

    count
  end

  def shell_sort
    count = 0
    gs = shell_gs
    gs.each do |g|
      count += insertion_sort(g)
    end
    count
  end

  def shell_gs
    return [1] if length == 1
    ret = []
    l = 1
    while l < length
      ret.push(l)
      l = 3 * l + 1
    end
    ret.reverse
  end
end

#
# main logic which has only one public method Solver#solve
#
class Solver
  include Input

  def initialize
    @n = geti
    @nums = (1..@n).map { geti }
  end

  def solve
    gs = @nums.shell_gs
    m = gs.length
    count = @nums.shell_sort

    puts m
    puts gs.join(' ')
    puts count
    @nums.each { |n| puts n }
  end
end

s = Solver.new
s.solve
