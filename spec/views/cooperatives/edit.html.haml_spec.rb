require 'spec_helper'

describe "cooperatives/edit" do
  before(:each) do
    @cooperative = assign(:cooperative, stub_model(Cooperative))
  end

  it "renders the edit cooperative form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cooperatives_path(@cooperative), :method => "post" do
    end
  end
end
