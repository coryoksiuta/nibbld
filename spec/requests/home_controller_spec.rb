require "rails_helper"

describe HomeController, type: :request do
  let(:resource) { get root_path }

  context "Not Signed In" do
    it("Redirects to Sign In") { expect(resource).to redirect_to new_user_session_path }
  end

  context "Signed In" do
    let!(:user) { create :user }

    before(:each) { sign_in user }

    it("Displays the Page") { resource; expect(response).to be_successful }
  end
end
