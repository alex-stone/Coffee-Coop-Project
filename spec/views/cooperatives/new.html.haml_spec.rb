require 'spec_helper'

describe "cooperatives/new" do
  before(:each) do
    assign(:cooperative, stub_model(Cooperative).as_new_record)
  end

  it "renders new cooperative form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cooperatives_path, :method => "post" do
    end
  end
end
