require_relative 'fundrequest'
require_relative 'project'


project1 = Project.new("Project LMN", 3000, 500)
project2 = Project.new("Project XYZ", 100, 25)
project3 = Project.new("Project TBD", 1000, 300)

projects = FundRequest.new("VC-Friendly Start-up Projects")

puts projects.title

projects.add_project(project1)
projects.add_project(project2)
projects.add_project(project3)

projects.request_funding(3)

projects.print_results
