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

    it "raises error if subscribe failed" do
      stub_post("/rest/v2/things/155759/subscriptions").to_return(
          :body => fixture("subscribe_failed.json"),
          :status => 403,
          :headers => { :content_type => "application/json; charset=utf-8"}
      )
      expect { client.subscribe 155759 }.to raise_error Flattr::Error::Forbidden
    end
  end

  describe "#unsubscribe" do
    before do
      stub_delete("/rest/v2/things/155759/subscriptions").to_return(
          :body => "",
          :headers => { :content_type => "application/json; charset=utf-8"},
          :status => 204
      )
    end

    it "does a request" do
      client.unsubscribe 155759
      expect( a_delete("/rest/v2/things/155759/subscriptions") ).to have_been_made
    end

    it "unsubscribes if user is subscribed" do
      client.unsubscribe(155759).should be_true
    end

    it "raises error if unsubscribe failed" do
      stub_delete("/rest/v2/things/155759/subscriptions").to_return(
          :body => "",
          :headers => { :content_type => "application/json; charset=utf-8"},
          :status => 404
      )
      expect { client.unsubscribe 155759 }.to raise_error Flattr::Error::NotFound
    end

  end

  describe "#subscription_toggle" do
    before do
      stub_put("/rest/v2/things/155759/subscriptions").to_return(
          :body => '{ "message": "started", "description": "Subscription started" }',
          :headers => { :content_type => "application/json; charset=utf-8"},
          :status => 200
      )
    end

    it "does a request" do
      client.subscription_toggle 155759
      expect( a_put("/rest/v2/things/155759/subscriptions") ).to have_been_made
    end

    it "return true if subscription is running" do
      client.subscription_toggle(155759).should be_true
    end

    it "returns false if subscription is paused" do
      stub_put("/rest/v2/things/155759/subscriptions").to_return(
          :body => '{ "message": "paused", "description": "Subscription paused" }',
          :headers => { :content_type => "application/json; charset=utf-8"},
          :status => 200
      )
      client.subscription_toggle(155759).should be_false
    end

  end

end
