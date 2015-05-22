class Course
  include Cequel::Record

  key :id, :uuid, auto: true

  column :name, :text, index: true
  column :hours, :bigint

  validates :name, presence: true

  timestamps

  def parents
    Edge.with_child_id(id).map &:parent
  end

  # This is so we don't get a NoMethodError.
  def children; end

  # This is the base case and should return self
  def subtree
    self
  end

  def named_subtree
    { name: name }
  end

end
