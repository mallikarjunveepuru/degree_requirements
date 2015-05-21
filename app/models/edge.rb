class Edge
  include Cequel::Record

  key    :id, :uuid, auto: true

  column :parent_id, :uuid, index: true
  column :child_id,  :uuid
  column :child_klass, :text


  timestamps

  def parent
    Requirement[parent_id]
  end

  def child
    child_klass.constantize[child_id]
  end 

end

