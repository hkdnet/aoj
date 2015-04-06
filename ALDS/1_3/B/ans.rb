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
    @n, @quantum = getis
    @tasks = (1..@n).map do
      tmp = gets.chomp.split
      tmp[1] = tmp[1].to_i
      tmp
    end
    @time = 0
  end

  def solve
    while @tasks.size > 0
      res = exec_task
      puts res if res
    end
  end

  private

  def exec_task
    t = @tasks.shift
    if t[1] <= @quantum
      @time += t[1]
      "#{t[0]} #{@time}"
    else
      t[1] -= @quantum
      @time += @quantum
      @tasks.push(t)
      false
    end
  end
end

s = Solver.new
s.solve
