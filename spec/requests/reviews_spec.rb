require 'spec_helper'

describe "Reviews" do
  describe "GET /reviews" do
    it "works! (now write some real specs)" do
      get reviews_path
      expect(response.status).to be(200)
    end
  end
end
