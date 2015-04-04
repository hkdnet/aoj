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
    bubble_sort
    puts 'Stable' # bubble sort is always stable
    selection_sort
    puts match?(@arr_1, @arr_2) ? 'Stable' : 'Not stable'
  end

  def bubble_sort
    (0...@n).each do |i|
      (@n - 1).downto(i + 1) do |j|
        swap(@arr_1, j - 1, j) if @arr_1[j] < @arr_1[j - 1]
      end
    end

    puts @arr_1.join(' ')
  end

  def rank(card)
    card[1].to_i
  end

  def swap(arr, i, j)
    arr[i], arr[j] = [arr[j], arr[i]] unless i == j
  end

  def selection_sort
    (0...@n).each do |i|
      mini = i
      (i...@n).each { |j| mini = j if @arr_2[j] < @arr_2[mini] }
      swap(@arr_2, mini, i)
    end
    puts @arr_2.join(' ')
  end

  def match?(a1, a2)
    a1.zip(a2).all? { |e1, e2| e1.equal?(e2) }
  end
end

s = Solver.new
s.solve
