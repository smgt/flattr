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

end
