require 'spec_helper'

describe "businessrequests/new" do
  before(:each) do
    assign(:businessrequest, stub_model(Businessrequest,
      :kvk => "MyString",
      :company => "MyString",
      :phone => "MyString",
      :request => "MyText"
    ).as_new_record)
  end

  it "renders new businessrequest form" do
    render

    assert_select "form[action=?][method=?]", businessrequests_path, "post" do
      assert_select "input#businessrequest_kvk[name=?]", "businessrequest[kvk]"
      assert_select "input#businessrequest_company[name=?]", "businessrequest[company]"
      assert_select "input#businessrequest_phone[name=?]", "businessrequest[phone]"
      assert_select "textarea#businessrequest_request[name=?]", "businessrequest[request]"
    end
  end
end
