class Major
  include Cequel::Record

  belongs_to :requirement

  column :name, :text
  key :id, :uuid, auto: true

  validates :name, presence: true

  def requirement_tree
    requirement.subtree
  end

end
