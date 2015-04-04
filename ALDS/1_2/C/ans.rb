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
# data-class
#
class Card
  include Comparable

  attr_reader :suit, :rank

  def initialize(c)
    @c = c
    @suit = c[0]
    @rank = c[1].to_i
  end

  def <=>(other)
    @rank <=> other.rank
  end

  def to_s
    @c
  end

  def equal?(other)
    @c.to_s == other.to_s
  end
end

#
# expand Array Class
#
class Array
  def swap(i, j)
    self[i], self[j] = [self[j], self[i]] unless i == j
  end

  def bubble_sort
    n = length
    (0...n).each do |i|
      (n - 1).downto(i + 1) do |j|
        swap(j - 1, j) if self[j] < self[j - 1]
      end
    end
  end

  def selection_sort
    n = length
    (0...n).each do |i|
      mini = i
      (i...n).each { |j| mini = j if self[j] < self[mini] }
      swap(mini, i)
    end
  end
end

#
# main logic which has only one public method Solver#solve
#
class Solver
  include Input

  def initialize
    @n = geti
    @arr = gets.chomp.split.map { |c| Card.new(c) }
    @arr_1 = @arr.dup
    @arr_2 = @arr.dup
    @arr = nil
  end

  def solve
    @arr_1.bubble_sort
    puts @arr_1.join(' ')
    puts 'Stable' # bubble sort is always stable
    @arr_2.selection_sort
    puts @arr_2.join(' ')
    puts match?(@arr_1, @arr_2) ? 'Stable' : 'Not stable'
  end

  private

  def match?(a1, a2)
    a1.zip(a2).all? { |e1, e2| e1.equal?(e2) }
  end
end

s = Solver.new
s.solve
