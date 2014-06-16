require 'spec_helper'

describe "businessrequests/edit" do
  before(:each) do
    @businessrequest = assign(:businessrequest, stub_model(Businessrequest,
      :kvk => "MyString",
      :company => "MyString",
      :phone => "MyString",
      :request => "MyText"
    ))
  end

  it "renders the edit businessrequest form" do
    render

    assert_select "form[action=?][method=?]", businessrequest_path(@businessrequest), "post" do
      assert_select "input#businessrequest_kvk[name=?]", "businessrequest[kvk]"
      assert_select "input#businessrequest_company[name=?]", "businessrequest[company]"
      assert_select "input#businessrequest_phone[name=?]", "businessrequest[phone]"
      assert_select "textarea#businessrequest_request[name=?]", "businessrequest[request]"
    end
  end
end
