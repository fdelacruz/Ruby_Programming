require_relative 'fundrequest'

describe FundRequest do
  
  before do
    @initial_funding = 500
    @project = Project.new("Project ABC", 3000, @initial_funding)
    
    @fundrequest = FundRequest.new("VC-Friendly Start-up Projects")
    @fundrequest.add_project(@project)
  end

  it "adds funds to a project if an even number is rolled" do
    Die.any_instance.stub(:roll).and_return(2) 

    @fundrequest.request_funding
   
    @project.funding.should == @initial_funding + 25
  end

  it "substracts funds from a project if an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(3) 

    @fundrequest.request_funding

    @project.funding.should == @initial_funding - 15
  end
end
