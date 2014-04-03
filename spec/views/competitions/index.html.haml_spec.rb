require 'spec_helper'

describe "competitions/index" do
  before(:each) do
    assign(:competitions, [
      stub_model(Competition,
        :title => "Title",
        :description => "Description",
        :prize => "Prize"
      ),
      stub_model(Competition,
        :title => "Title",
        :description => "Description",
        :prize => "Prize"
      )
    ])
  end

  it "renders a list of competitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Prize".to_s, :count => 2
  end
end
