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
    bubble_sort(@arr_1)
    puts 'Stable' # bubble sort is always stable
    selection_sort(@arr_2)
    puts match?(@arr_1, @arr_2) ? 'Stable' : 'Not stable'
  end

  private

  def bubble_sort(arr)
    (0...@n).each do |i|
      (@n - 1).downto(i + 1) do |j|
        swap(arr, j - 1, j) if arr[j] < arr[j - 1]
      end
    end

    puts arr.join(' ')
  end

  def swap(arr, i, j)
    arr[i], arr[j] = [arr[j], arr[i]] unless i == j
  end

  def selection_sort(arr)
    (0...@n).each do |i|
      mini = i
      (i...@n).each { |j| mini = j if arr[j] < arr[mini] }
      swap(arr, mini, i)
    end
    puts arr.join(' ')
  end

  def match?(a1, a2)
    a1.zip(a2).all? { |e1, e2| e1.equal?(e2) }
  end
end

s = Solver.new
s.solve
