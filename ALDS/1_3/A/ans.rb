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
    @expr = gets.chomp.split
    @calc_stack = []
  end

  def solve
    @expr.each { |s| exec(s) }
    puts @calc_stack.pop
  end

  private

  def int?(str)
    /\d+/ =~ str
  end

  def exec(s)
    if int?(s)
      @calc_stack.push(s.to_i)
    else
      a = @calc_stack.pop
      b = @calc_stack.pop
      @calc_stack.push(calc(b, s, a))
    end
  end

  def calc(o1, op, o2)
    case op
    when '+'
      o1 + o2
    when '-'
      o1 - o2
    when '*'
      o1 * o2
    end
  end
end

s = Solver.new
s.solve
