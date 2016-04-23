require 'spec_helper'

describe SinatraBabies::Controllers::BabiesController do
  before do
    @daddy = User.create(username: "Daddy1999", email: "Dad@internet.com", password: "password")
    @stranger = User.create(username: "Stranger", email: "Stranger@stranger.com", password: "password")
    @lucas = Baby.new(name: "Lucas")
    @lucas.user = @daddy
    @lucas.save
    
  end

  it "requires a user be logged into access any babies resource" do
    get '/babies', {}, {'rack.session' => {user_id: nil}}
    follow_redirect!
    expect(last_response.body).to include('have to be logged in')
  end

  it "only lets a parent view their own babies" do
    get '/babies', {}, {'rack.session' => {user_id: @daddy.id}}
    expect(last_response.body).to include('Lucas')
  end

  it "doesn't let a user view another user's babies" do
    get "/babies/#{@lucas.id}", {}, {'rack.session' => {user_id: @stranger.id}}
    expect(last_response.status).to eq(302)
  end

  context "creating a new baby" do

    it "creates a new baby with the user_id set to current_user's id" do
      visit '/users/login'
      fill_in "email", with: "Dad@internet.com"
      fill_in "password", with: "password"
      click_button "Login"
      click_link "Add a new baby"
      fill_in :name, with: "Girl baby"
      click_button "Add My Baby"
      expect(Baby.all.count).to eq(2)
      expect(page.body).to include("Success!")
    end

    it "displays error if form submitted isn't valid" do
      visit '/users/login'
      fill_in "email", with: "Dad@internet.com"
      fill_in "password", with: "password"
      click_button "Login"
      click_link "Add a new baby"
      fill_in :name, with: ""
      click_button "Add My Baby"
      expect(page.body).to include("Can't be blank")
    end
  end

  context "removing a baby from accont" do
    it "allows user to remove a baby from their account" do
      Capybara.current_driver = :selenium
      
      #Get the main window handle
      main = page.driver.browser.window_handles.first

      visit '/users/login'
      fill_in "email", with: "Dad@internet.com"
      fill_in "password", with: "password"
      click_button "Login"
      click_link "Lucas"
      click_button "Remove Lucas from Sinatra Babies"
      page.driver.browser.switch_to.alert.accept
      page.driver.browser.switch_to.window(main)
      
      expect(Baby.all.count).to eq(0)
      expect(page.body).to include('Add a new baby')
      
      Capybara.use_default_driver
    end
  end
end
