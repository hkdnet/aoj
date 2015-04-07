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
# doubly linked-list
#
module DoublyLinkedList
  #
  # DoublyLinkedList.Node
  #
  class Node
    attr_accessor :parent, :child
    attr_reader :id

    def initialize(id)
      @id = id
      @parent = self
      @child = self
    end
  end

  #
  # DoublyLinkedList
  #
  class List
    def initialize
      @count = 0
    end

    def to_a
      tmp = @head
      (1..@count).map do
        ret = tmp.id
        tmp = tmp.child
        ret
      end
    end

    def insert(key)
      n = Node.new(key)
      if @count == 0
        @head = n
      else
        link(@head.parent, n)
        link(n, @head)
        @head = n
      end
      @count += 1
    end

    def delete(key)
      tmp = @head
      @count.times do
        break if tmp.id == key
        tmp = tmp.child
      end
      link(tmp.parent, tmp.child)
      @count -= 1
    end

    def delete_first
      new_head = @head.child
      link(@head.parent, new_head)
      @head = new_head
      @count -= 1
    end

    def delete_last
      link(@head.parent.parent, @head)
      @count -= 1
    end

    private

    def link(p, c)
      p.child = c
      c.parent = p
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
    @cmd = (1..@n).map { gets.chomp.split }
  end

  def solve
    @l = DoublyLinkedList::List.new
    @cmd.each { |c| exec c }
    puts @l.to_a.join(' ')
  end

  private

  def exec(c)
    case c[0]
    when 'deleteFirst'
      @l.delete_first
    when 'deleteLast'
      @l.delete_last
    when 'insert'
      @l.insert c[1]
    when 'delete'
      @l.delete c[1]
    end
  end
end

s = Solver.new
s.solve
