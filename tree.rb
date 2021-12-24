class Tree
  attr_accessor :array, :root

  def initialize(array)
    @array = array
    @root = build_tree(array)
  end

  def build_tree(ary)
    ary = ary.sort.uniq
    create_BST(ary)
  end

  def create_BST(ary, first = 0, last = ary.size - 1)
    return if first > last

    mid = (first + last) / 2
    node = Node.new(ary[mid])
    node.left = create_BST(ary, first, mid - 1)
    node.right = create_BST(ary, mid + 1, last)
    node
  end

  def insert(value, node = root)
    return if node == value

    if node > value
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    elsif node < value
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
  end

  def delete(value, node = root)
    return if find(value).nil?

    if node.data == value
      if node.right && node.left
        successor = node.right
        successor = successor.left until successor.left.nil?
        node.data = successor.data
        node.right = delete(successor.data, node.right)
        return node
      end
      return node.right if node.right
      return node.left if node.left

      return nil
    end
    if node.data < value
      node.right = delete(value, node.right)
    elsif node.data > value
      node.left = delete(value, node.left)
    end
    node
  end

  def find(value, node = root)
    return node if node.data == value
    return nil if node.right.nil? && node.left.nil?

    if node.data < value
      find(value, node.right)
    elsif node.data > value
      find(value, node.left)
    end
  end

  def level_order(&block)
    queue = [root]
    result = []
    loop do
      dequeued_node = queue.shift
      result.push(dequeued_node)
      queue.push(dequeued_node.left) if dequeued_node.left
      queue.push(dequeued_node.right) if dequeued_node.right
      break if queue.empty?
    end
    if block_given?
      result.map(&block)
    else
      result.map { |node| node.data }
    end
  end

  def inorder(node = root, array = [], &block)
    return if node.nil?

    inorder(node.left, array)
    array.push(node)
    inorder(node.right, array)
    if block_given?
      array.map(&block)
    else
      array.map { |node| node.data }
    end
  end

  def preorder(node = root, array = [], &block)
    return if node.nil?

    array.push(node)
    preorder(node.left, array)
    preorder(node.right, array)
    if block_given?
      array.map(&block)
    else
      array.map { |node| node.data }
    end
  end

  def postorder(node = root, array = [], &block)
    return if node.nil?

    postorder(node.left, array)
    postorder(node.right, array)
    array.push(node)
    if block_given?
      array.map(&block)
    else
      array.map { |node| node.data }
    end
  end

  def height(value, counter = 0)
    node = find(value)
    return counter if node.left.nil? && node.right.nil?

    counter += 1
    a = height(node.right.data, counter) if node.right
    b = height(node.left.data, counter) if node.left
    a.to_i > b.to_i ? a : b
  end

  def depth(value, node = root, counter = 0)
    return counter if node.data == value

    counter += 1
    if node.data < value
      depth(value, node.right, counter)
    else
      depth(value, node.left, counter)
    end
  end

  def balanced?(node = root)
    return true if node.right.nil? && node.left.nil?

    if node.right.nil?
      height(node.left.data) == 0
    elsif node.left.nil?
      height(node.right.data) == 0
    else
      a = height(node.right.data)
      b = height(node.left.data)
      return false unless (a - b).between?(-1, 1)

      balanced?(node.left) && balanced?(node.right) ? true : false
    end
  end

  def rebalance
    self.array = inorder
    self.root = build_tree(array)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
