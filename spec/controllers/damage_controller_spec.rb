require 'spec_helper'

describe DamageController do

  describe "GET 'calc'" do
    it "returns http success" do
      get 'calc'
      response.should be_success
    end
  end

end
