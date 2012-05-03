require 'spec_helper'

describe "cooperatives/show" do
  before(:each) do
    @cooperative = assign(:cooperative, stub_model(Cooperative))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
