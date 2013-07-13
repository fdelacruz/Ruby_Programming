require_relative 'project'

describe Project do

    before do
      @initial_funding = 500
      @project = Project.new("Project ABC", 3000, @initial_funding)
      $stdout = StringIO.new
    end

    it "has an initial target funding amount" do
      @project.target.should == 3000
    end

    it "computes the total funding outstanding as the target funding amount minus the funding amount" do
      @project.funding_needed.should == (3000 - 500)
    end

    it "increases funds by 25 when funds are added" do
      @project.add_funds

      @project.funding.should == (@initial_funding + 25)
    end

    it "decreases funds by 15 when funds are removed" do
      @project.substract_funds

      @project.funding.should == (@initial_funding - 15)
    end
    
    context "created without a funding amount" do
      before do
        @project = Project.new("Project ABC", 3000)
      end

      it "has a default value of 0 for funding amount" do
        @project.funding.should == 0
      end
    end

end
