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
    @arr = gets.chomp.split
    @arr_1 = @arr.dup
    @arr_2 = @arr.dup
    @arr = nil
  end

  def solve
    bubble_sort
    puts 'Stable'
    selection_sort
    puts match?(@arr_1, @arr_2) ? 'Stable' : 'Not stable'
  end

  def bubble_sort
    (0...@n).each do |i|
      (@n - 1).downto(i + 1) do |j|
        swap(@arr_1, j - 1, j) if rank(@arr_1[j]) < rank(@arr_1[j - 1])
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
      (i...@n).each { |j| mini = j if rank(@arr_2[j]) < rank(@arr_2[mini]) }
      swap(@arr_2, mini, i)
    end
    puts @arr_2.join(' ')
  end

  def match?(a1, a2)
    a1.zip(a2).all? { |e1, e2| e1 == e2 }
  end
end

s = Solver.new
s.solve
