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
        rank(@arr_1[j]) < rank(@arr_1[j - 1]) && nums_swap_at(j)
      end
    end

    puts @arr_1.join(' ')
  end

  def rank(card)
    card[1].to_i
  end

  def nums_swap_at(idx)
    swap(@arr_1, idx - 1, idx)
  end

  def swap(arr, i, j)
    arr[i], arr[j] = [arr[j], arr[i]] unless i == j
  end

  def selection_sort
    (0...@n).each do |i|
      mini = i
      (i...@n).each { |j| mini = j if rank(@arr_2[j]) < rank(@arr_2[mini]) }
      @arr_2[i], @arr_2[mini] = [@arr_2[mini], @arr_2[i]] if i != mini
    end
    puts @arr_2.join(' ')
  end

  def match?(a1, a2)
    a1.zip(a2).all? { |e1, e2| e1 == e2 }
  end
end

s = Solver.new
s.solve
