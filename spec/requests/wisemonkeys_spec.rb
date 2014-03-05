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

  end



end
