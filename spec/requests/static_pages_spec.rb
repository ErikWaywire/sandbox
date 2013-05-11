require 'spec_helper'

describe "StaticPages" do
	
  describe "Home page" do
    it "should have the content 'sandbox'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      page.should have_content('Sandbox')
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:post, user: user, body: "Lorem ipsum")
        FactoryGirl.create(:post, user: user, body: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.body)
        end
      end
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit help_path
      page.should have_content('Help')
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit about_path
      page.should have_content('About Us')
    end
  end
end
