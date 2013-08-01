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

  context "when total funding outstanding is less than or equal to 0" do
    before do
      @project = Project.new("Project ABC", 3000, 5000)
    end

    it "is fully-funded" do
      @project.should be_fully_funded
    end
  end

  context "when total funding outstanding is greater than 0" do
    before do
      @project = Project.new("Project ABC", 5000, 1000)
    end

    it "is under-funded" do
      @project.should_not be_fully_funded
    end
  end

  it "computes pledges as the sum of all pledges" do
    @project.pledges.should == 0

    @project.received_pledge(Pledge.new(:silver, 75))

    @project.pledges.should == 75

    @project.received_pledge(Pledge.new(:gold, 100))

    @project.pledges.should == 175

    @project.received_pledge(Pledge.new(:gold, 100))

    @project.pledges.should == 275
  end

  it "computes total funds as the sum of a projects funding and pledges" do
    @project.received_pledge(Pledge.new(:gold, 100))
    @project.received_pledge(Pledge.new(:gold, 100))

    @project.total_funds.should == 700
  end

  it "yields each received pledge and its total pledge amount" do
    @project.received_pledge(Pledge.new(:bronze, 50))
    @project.received_pledge(Pledge.new(:silver, 75))
    @project.received_pledge(Pledge.new(:silver, 75))
    @project.received_pledge(Pledge.new(:gold, 100))
    @project.received_pledge(Pledge.new(:gold, 100))
    @project.received_pledge(Pledge.new(:gold, 100))

    yielded = []
    @project.each_received_pledge do |pledge|
      yielded << pledge
    end

    yielded.should == [
      Pledge.new(:bronze, 50), 
      Pledge.new(:silver, 150), 
      Pledge.new(:gold, 300)
    ]
  end

end
