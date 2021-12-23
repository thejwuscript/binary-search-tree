require_relative 'node.rb'
require_relative 'tree.rb'

example = [749, 375, 289, 458, 253, 305, 189, 320, 548, 484, 172, 819, 406, 27, 839, 31, 198, 716, 93, 399, 222, 532, 943, 294, 363, 578, 475, 317]
tree = Tree.new(example)
tree.pretty_print