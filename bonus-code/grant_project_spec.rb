dequire_relative 'grant_project'

describe GrantProject do
  
  before do
    @initial_funding = 500
    @project = GrantProject.new("Grant 123", 3000, @initial_funding)
    $stdout = StringIO.new
  end

  it "cannot remove funds from project" do
    @project.substract_funds
    @project.funding.should == @initial_funding
  end

end


