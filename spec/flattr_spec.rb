require 'helper'

describe Flattr do

  after do
    Flattr.reset
  end

  describe '#respond_to?' do
    it "should take an optional argument" do
      Flattr.respond_to?(:new, true).should be_true
    end
  end

  describe "#new" do
    it "should return a Flattr::Client" do
      Flattr.new.should be_a Flattr::Client
    end
  end

  describe "#adapter" do
    it "should return the default adapter" do
      Flattr.adapter.should == Flattr::Config::DEFAULT_ADAPTER
    end
  end

  describe "#adapter=" do
    it "should set the adapter" do
      Flattr.adapter = :typhoeus
      Flattr.adapter.should == :typhoeus
    end
  end

  describe "#endpoint" do
    it "should return the default endpoint" do
      Flattr.endpoint.should == Flattr::Config::DEFAULT_ENDPOINT
    end
  end

  describe "#endpoint=" do
    it "should set the endpoint" do
      Flattr.endpoint = 'http://tumblr.com/'
      Flattr.endpoint.should == 'http://tumblr.com/'
    end
  end

  describe "#user_agent" do
    it "should return the default user agent" do
      Flattr.user_agent.should == Flattr::Config::DEFAULT_USER_AGENT
    end
  end

  describe "#user_agent=" do
    it "should set the user_agent" do
      Flattr.user_agent = 'Custom User Agent'
      Flattr.user_agent.should == 'Custom User Agent'
    end
  end

  describe "#configure" do
    Flattr::Config::VALID_OPTIONS_KEYS.each do |key|
      it "should set the #{key}" do
        Flattr.configure do |config|
          config.send("#{key}=", key)
          Flattr.send(key).should == key
        end
      end
    end
  end

end
