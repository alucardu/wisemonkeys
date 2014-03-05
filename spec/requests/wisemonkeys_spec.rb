require 'spec_helper'

describe "WiseMonkeys" do

subject { page }

  describe "Homepage" do
    it "cannot be loaded" do
      get root_path
    end
  end

  describe "Upload page" do
  	before {visit pictures_path}
  	it {should have_content("Kunst Uploaden")}
  	it {should have_link("Klik om kunst te uploaden")}
  end

  describe "New page" do
  	before {visit pictures_new_path}
  	it {should have_content("Picture Upload")}
  	it {should have_content("Title")}
  	it {should have_content("Description")}
  end


end
