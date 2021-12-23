require_relative 'node.rb'
require_relative 'tree.rb'

example = [749, 375, 289, 458, 253, 305, 189, 320, 548, 484, 172, 819, 406]
system('clear')
tree = Tree.new(example)
tree.pretty_print
