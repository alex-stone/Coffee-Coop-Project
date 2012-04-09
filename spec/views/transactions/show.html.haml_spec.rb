require 'spec_helper'

describe "transactions/show" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Producer/)
    rendered.should match(/Code/)
    rendered.should match(/Center/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(/MyText/)
    rendered.should match(/Delivery Form/)
    rendered.should match(/Quality/)
    rendered.should match(/Classes/)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/13/)
    rendered.should match(/14/)
    rendered.should match(/Received By/)
    rendered.should match(/15/)
  end
end
