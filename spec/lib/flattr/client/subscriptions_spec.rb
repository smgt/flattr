require "helper"

describe Flattr::Client::Subscriptions do

  subject(:client) { Flattr.new }

  describe "#subscribe" do
    before do
      stub_post("/rest/v2/things/155759/subscriptions").to_return(
          :body => fixture("new_subscription.json"),
          :headers => { :content_type => "application/json; charset=utf-8"}
      )
    end

    it "requests the correct source on post" do
      client.subscribe 155759
      expect( a_post("/rest/v2/things/155759/subscriptions") ).to have_been_made
    end

    it "returns true if subscribe worked" do
      subscription = client.subscribe 155759
      subscription.should be_true
    end

    it "returns false if subscribe failed" do
      stub_post("/rest/v2/things/155759/subscriptions").to_return(
          :body => fixture("subscribe_failed.json"),
          :status => 403,
          :headers => { :content_type => "application/json; charset=utf-8"}
      )
      expect { client.subscribe 155759 }.to raise_error Flattr::Error::Forbidden
    end
  end

  describe "#unsubscribe" do
    pending
  end

  describe "#pause" do
    pending
  end

  describe "#resume" do
    pending
  end


end
