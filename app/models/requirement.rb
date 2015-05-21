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

end
