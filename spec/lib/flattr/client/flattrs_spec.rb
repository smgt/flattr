require "helper"

describe Flattr::Client::Flattrs do

  before do
    @client = Flattr.new
  end

  describe "#flattr" do
    before do
      stub_post("/rest/v2/things/969122/flattr").to_return(:body => fixture("flattr.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource on get" do
      @client.flattr 969122
      expect(a_post("/rest/v2/things/969122/flattr")).to have_been_made
    end
    it "returns a user" do
      flattr = @client.flattr 969122
      expect(flattr).to be true
    end
  end
end
