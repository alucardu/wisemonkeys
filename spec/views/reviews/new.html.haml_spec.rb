require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :name => "MyString",
      :feedback => "MyText"
    ).as_new_record)
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input#review_name[name=?]", "review[name]"
      assert_select "textarea#review_feedback[name=?]", "review[feedback]"
    end
  end
end
