require "helper"

describe Flattr::Client::Users do

  before do
    @client = Flattr.new
  end

  describe "#user" do
    before do
      stub_get("/rest/v2/users/smgt").to_return(:body => fixture("user_smgt.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource on get" do
      @client.user "smgt"
      expect(a_get("/rest/v2/users/smgt")).to have_been_made
    end
    it "returns a user" do
      user = @client.user "smgt"
      expect(user).to be_a Flattr::User
      expect(user.username).to eq "smgt"
    end
  end

  describe "#user_things" do
    before do
      stub_get("/rest/v2/users/smgt/things").to_return(:body => fixture("things.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource on get" do
      @client.user_things "smgt"
      expect(a_get("/rest/v2/users/smgt/things")).to have_been_made
    end
    it "returns a list with things" do
      things = @client.user_things "smgt"
      expect(things).to be_a Array
      expect(things.first).to be_a Flattr::Thing
      expect(things.first.id).to eq 1114710
    end
  end

  describe "#user_flattrs" do
    before do
      stub_get("/rest/v2/users/smgt/flattrs").to_return(:body => fixture("flattrs.json"), :headers => {:content_type => "application/json; charset=utf-8"})
    end
    it "requests the correct resource on get" do
      @client.user_flattrs "smgt"
      expect(a_get("/rest/v2/users/smgt/flattrs")).to have_been_made
    end
    it "returns a list with flattrs" do
      flattrs = @client.user_flattrs "smgt"
      expect(flattrs).to be_a Array
      expect(flattrs.first["type"]).to eq "flattr"
    end
  end

end
