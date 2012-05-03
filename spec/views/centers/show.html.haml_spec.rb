require 'spec_helper'

describe "centers/show" do
  before(:each) do
    @center = assign(:center, stub_model(Center))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
