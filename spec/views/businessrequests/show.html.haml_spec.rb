require 'spec_helper'

describe "businessrequests/show" do
  before(:each) do
    @businessrequest = assign(:businessrequest, stub_model(Businessrequest,
      :kvk => "Kvk",
      :company => "Company",
      :phone => "Phone",
      :request => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Kvk/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/MyText/)
  end
end
