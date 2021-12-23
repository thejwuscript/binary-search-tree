class Tree
  attr_accessor :array
  attr_reader :root

  def initialize(array)
    @array = array
    @root = build_tree
  end
end
