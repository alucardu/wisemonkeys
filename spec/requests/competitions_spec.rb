require 'spec_helper'

describe "Competitions" do
  describe "GET /competitions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get competitions_path
      expect(response.status).to be(200)
    end
  end
end
