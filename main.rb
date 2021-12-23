require_relative 'node.rb'
require_relative 'tree.rb'

system('clear')
puts 'Driver Script'
puts ''
puts 'Create an array of random numbers'
p array = Array.new(15) { rand(1..100) }
puts ''
puts 'Create a binary tree from the above array'
tree = Tree.new(array)
tree.pretty_print
puts ''
puts 'Is the tree balanced?'
puts tree.balanced?
puts ''
puts 'Print out all elements in the following format:'
puts "Level order ➡  #{tree.level_order}"
puts "Preorder    ➡  #{tree.preorder}"
puts "Inorder     ➡  #{tree.inorder}"
puts "Postorder   ➡  #{tree.postorder}"
puts ''
puts 'Unbalance the tree by adding numbers greater than 100'
tree.insert(673); tree.insert(3811); tree.insert(9221)
tree.pretty_print
puts ''
puts 'Is the tree balanced?'
puts tree.balanced?
puts ''
puts 'Balance the tree'
tree.rebalance
tree.pretty_print
puts ''
puts 'Is the tree balanced?'
puts tree.balanced?
puts ''
puts 'Print out all elements in the following format:'
puts "Level order ➡  #{tree.level_order}"
puts "Preorder    ➡  #{tree.preorder}"
puts "Inorder     ➡  #{tree.inorder}"
puts "Postorder   ➡  #{tree.postorder}"
