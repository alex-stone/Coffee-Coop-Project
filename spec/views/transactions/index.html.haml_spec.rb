require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :producer => "Producer",
        :code => "Code",
        :center => "Center",
        :lot_number => 1,
        :sack_number => 2,
        :gross_weight => 3,
        :tare => 4,
        :net_weight => 5,
        :price => 6,
        :comments => "MyText",
        :delivery_form => "Delivery Form",
        :quality => "Quality",
        :classes => "Classes",
        :s_f => 7,
        :bitten => 8,
        :bare => 9,
        :green => 10,
        :drill => 11,
        :mold => 12,
        :gqmd => 13,
        :total => 14,
        :received_by => "Received By",
        :user_id => 15
      ),
      stub_model(Transaction,
        :producer => "Producer",
        :code => "Code",
        :center => "Center",
        :lot_number => 1,
        :sack_number => 2,
        :gross_weight => 3,
        :tare => 4,
        :net_weight => 5,
        :price => 6,
        :comments => "MyText",
        :delivery_form => "Delivery Form",
        :quality => "Quality",
        :classes => "Classes",
        :s_f => 7,
        :bitten => 8,
        :bare => 9,
        :green => 10,
        :drill => 11,
        :mold => 12,
        :gqmd => 13,
        :total => 14,
        :received_by => "Received By",
        :user_id => 15
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Producer".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Center".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Received By".to_s, :count => 2
  end
end
