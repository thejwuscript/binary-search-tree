class Tree
  attr_accessor :array
  attr_reader :root

  def initialize(array)
    @array = array
    @root = build_tree
  end

  def build_tree
    self.array = array.sort.uniq
    create_BST(array)
  end

  def create_BST(ary, first = 0, last = ary.size - 1)
    return if first > last

    mid = (first + last) / 2
    node = Node.new(ary[mid])
    node.left = create_BST(ary, first, mid - 1)
    node.right = create_BST(ary, mid + 1, last)
    node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
