require 'spec_helper'

describe SinatraBabies::Controllers::EventsController do
  before do
    @daddy = User.create(username: "Daddy1999", email: "Dad@internet.com", password: "password")
    @stranger = User.create(username: "Stranger", email: "Stranger@stranger.com", password: "password")
    @lucas = Baby.new(name: "Lucas")
    @lucas.user = @daddy
    @lucas.save
  end

  context "only logged in users can access events" do
    it "redirects guests to the login page with a message" do
      get '/babies/1/events', {}, {'rack.session' => {user_id: nil}}
      follow_redirect!
      expect(last_response.body).to include('not allowed')
    end
  end

  context "creating a new event" do
    it "prompts for event type, then event description, then submits" do
      Capybara.current_driver = :selenium
      visit '/users/login'
      fill_in "email", with: "Dad@internet.com"
      fill_in "password", with: "password"
      click_button "Login"
      visit "/babies/#{@lucas.id}/events/new"
      find(:xpath, "//label[@for='pooped']").click
      find(:xpath, "//label[@for='a_lot']").click
      # time input default 
      click_button "Next"
      expect(page.body).to include("pooped")
      expect(page.body).to include("a lot")
      click_button "Yes"
      expect(Event.all.count).to eq(101)
      expect(@lucas.events.all.count).to eq(1)
      Capybara.use_default_driver
    end
  end

  it "for wake up there should be no description option" do
    Capybara.current_driver = :selenium
      visit '/users/login'
      fill_in "email", with: "Dad@internet.com"
      fill_in "password", with: "password"
      click_button "Login"
      visit "/babies/#{@lucas.id}/events/new"
      find(:xpath, "//label[@for='woke_up']").click
      # time input default 
      click_button "Next"
      expect(page.body).to include("woke up")
      click_button "Yes"
      expect(Event.all.count).to eq(101)
      expect(@lucas.events.all.count).to eq(1)
      Capybara.use_default_driver
  end
end
