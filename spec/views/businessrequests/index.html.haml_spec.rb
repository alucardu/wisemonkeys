require 'spec_helper'

describe "businessrequests/index" do
  before(:each) do
    assign(:businessrequests, [
      stub_model(Businessrequest,
        :kvk => "Kvk",
        :company => "Company",
        :phone => "Phone",
        :request => "MyText"
      ),
      stub_model(Businessrequest,
        :kvk => "Kvk",
        :company => "Company",
        :phone => "Phone",
        :request => "MyText"
      )
    ])
  end

  it "renders a list of businessrequests" do
    render
    assert_select "tr>td", :text => "Kvk".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
