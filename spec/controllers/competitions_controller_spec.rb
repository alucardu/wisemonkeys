require 'spec_helper'

describe CompetitionsController do

  describe "GET 'votepage'" do
    it "returns http success" do
      get 'votepage'
      expect(response).to be_success
    end
  end

end
