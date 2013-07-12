require_relative 'fundrequest'
require_relative 'project'


project1 = Project.new("Project LMN", 3000, 500)
project2 = Project.new("Project XYZ", 100, 25)
project3 = Project.new("Project TBD", 1000, 300)

vc_friendly = FundRequest.new("VC-Friendly Start-up Projects")

vc_friendly.add_project(project1)
vc_friendly.add_project(project2)
vc_friendly.add_project(project3)

vc_friendly.request_funding
