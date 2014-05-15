require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :name => "MyString",
      :feedback => "MyText"
    ))
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input#review_name[name=?]", "review[name]"
      assert_select "textarea#review_feedback[name=?]", "review[feedback]"
    end
  end
end
