require 'spec_helper'

describe "centers/index" do
  before(:each) do
    assign(:centers, [
      stub_model(Center),
      stub_model(Center)
    ])
  end

  it "renders a list of centers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
