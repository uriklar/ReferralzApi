require 'rails_helper'
 
RSpec.describe Business, :type => :model do
  before do
    @business = Business.new(name: "Ben Franklin Labs")
  end
 
  subject { @business }
 
  describe "when name is not present" do
    before { @business.name = " " }
    it { should_not be_valid }
  end
end