require "spec_helper"

class DummyController < ::ApplicationController
  include ::Refinery::ApplicationController
end

describe "Refinery::ApplicationController" do
  describe DummyController, :type => :controller do
    describe ".home_page?" do
      it "escapes regexp" do
        request.stub(:path).and_return("\/huh)")

        expect { controller.home_page? }.to_not raise_error(RegexpError)
      end
    end
  end
end
