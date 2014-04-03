require 'spec_helper'

describe "competitions/show" do
  before(:each) do
    @competition = assign(:competition, stub_model(Competition,
      :title => "Title",
      :description => "Description",
      :prize => "Prize"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Prize/)
  end
end
