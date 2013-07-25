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

    @fundrequest.request_funding(2)

    @project.funding.should == @initial_funding + (25 * 2)
  end

  it "substracts funds from a project if an odd number is rolled" do
    Die.any_instance.stub(:roll).and_return(3) 

    @fundrequest.request_funding(2)

    @project.funding.should == @initial_funding - (15 * 2)
  end

  it "assigns a pledge for amount during a project's funding round" do     
    fundrequest = FundRequest.new("VC-Friendly Start-up Projects")
    project = Project.new("Project ABC", 5000)

    fundrequest.add_project(project)

    fundrequest.request_funding(1)

    project.pledges.should_not be_zero
  end

end
