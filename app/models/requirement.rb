class Requirement
  include Cequel::Record

  column :name, :text
  column :min_grade, :text
  column :hours, :bigint
  column :take, :bigint

  key :id, :uuid, auto: true

  validates :name, presence: true

  def parents
    Edge.with_child_id(id).map &:parent
  end

  def children
    Edge.with_parent_id(id).map &:child
  end

  def subtree
    { self => children.compact.map(&:subtree) }
  end

  def named_subtree(width = nil)
    width ||= [children.count { |child| child.is_a? Requirement },10].max
    { name: name, children: (children.sample(width).map(&:named_subtree) << ( { name: "+#{children.size - width } more" } if children.size > width)).compact }
  end 

end
