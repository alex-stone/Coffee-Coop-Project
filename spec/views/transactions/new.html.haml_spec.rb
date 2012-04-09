require 'spec_helper'

describe "transactions/new" do
  before(:each) do
    assign(:transaction, stub_model(Transaction,
      :producer => "MyString",
      :code => "MyString",
      :center => "MyString",
      :lot_number => 1,
      :sack_number => 1,
      :gross_weight => 1,
      :tare => 1,
      :net_weight => 1,
      :price => 1,
      :comments => "MyText",
      :delivery_form => "MyString",
      :quality => "MyString",
      :classes => "MyString",
      :s_f => 1,
      :bitten => 1,
      :bare => 1,
      :green => 1,
      :drill => 1,
      :mold => 1,
      :gqmd => 1,
      :total => 1,
      :received_by => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path, :method => "post" do
      assert_select "input#transaction_producer", :name => "transaction[producer]"
      assert_select "input#transaction_code", :name => "transaction[code]"
      assert_select "input#transaction_center", :name => "transaction[center]"
      assert_select "input#transaction_lot_number", :name => "transaction[lot_number]"
      assert_select "input#transaction_sack_number", :name => "transaction[sack_number]"
      assert_select "input#transaction_gross_weight", :name => "transaction[gross_weight]"
      assert_select "input#transaction_tare", :name => "transaction[tare]"
      assert_select "input#transaction_net_weight", :name => "transaction[net_weight]"
      assert_select "input#transaction_price", :name => "transaction[price]"
      assert_select "textarea#transaction_comments", :name => "transaction[comments]"
      assert_select "input#transaction_delivery_form", :name => "transaction[delivery_form]"
      assert_select "input#transaction_quality", :name => "transaction[quality]"
      assert_select "input#transaction_classes", :name => "transaction[classes]"
      assert_select "input#transaction_s_f", :name => "transaction[s_f]"
      assert_select "input#transaction_bitten", :name => "transaction[bitten]"
      assert_select "input#transaction_bare", :name => "transaction[bare]"
      assert_select "input#transaction_green", :name => "transaction[green]"
      assert_select "input#transaction_drill", :name => "transaction[drill]"
      assert_select "input#transaction_mold", :name => "transaction[mold]"
      assert_select "input#transaction_gqmd", :name => "transaction[gqmd]"
      assert_select "input#transaction_total", :name => "transaction[total]"
      assert_select "input#transaction_received_by", :name => "transaction[received_by]"
      assert_select "input#transaction_user_id", :name => "transaction[user_id]"
    end
  end
end
