require 'spec_helper'

describe "competitions/new" do
  before(:each) do
    assign(:competition, stub_model(Competition,
      :title => "MyString",
      :description => "MyString",
      :prize => "MyString"
    ).as_new_record)
  end

  it "renders new competition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", competitions_path, "post" do
      assert_select "input#competition_title[name=?]", "competition[title]"
      assert_select "input#competition_description[name=?]", "competition[description]"
      assert_select "input#competition_prize[name=?]", "competition[prize]"
    end
  end
end
