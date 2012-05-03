require 'spec_helper'

describe "centers/edit" do
  before(:each) do
    @center = assign(:center, stub_model(Center))
  end

  it "renders the edit center form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => centers_path(@center), :method => "post" do
    end
  end
end
