require 'spec_helper'

describe "cooperatives/index" do
  before(:each) do
    assign(:cooperatives, [
      stub_model(Cooperative),
      stub_model(Cooperative)
    ])
  end

  it "renders a list of cooperatives" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
