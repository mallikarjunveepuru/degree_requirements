Dir.chdir Rails.root.join 'db'

# Procedures
def to_req(req)
  to_r = req.reject { |x| x["courses"] }
  to_r.map{ |k,v| k == "credits" ? ["hours", v] : [k,v] }.to_h
end

def edges(parent,courses)
  courses.each do |course|
    Edge.create(parent_id: parent.id, child_id: Course.find_by_name(course).id)
  end
end

add_requirement = proc do |req|
  this = Requirement.create(to_req(req))
  edges(this, req["courses"])
end

add_course = proc { |course| course.each_pair { |name, hours| Course.create name: name, hours: hours } }

# Courses file

courses = JSON.parse File.read("courses.json")


# Requirements Files

files = [
  "theatre.json",
  "fine_arts.json",
  "university.json"
]
requirements = files.flat_map { |file| JSON.parse File.read(file) }

# The actual seeding

courses.each &add_course
requirements.each &add_requirement
