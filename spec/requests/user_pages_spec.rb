require 'spec_helper'

describe "UserPages" do
  
	subject{page}

	describe "signup page" do

		before {visit signup_path}

		let(:submit) { "Create my account" }

		describe "with valid information" do
			before do
				fill_in "Name", with: "Chee Peng"
				fill_in "Email", with: "v.handed@gmail.com"
				fill_in "Password", with: "sunflower"
				fill_in "Confirmation", with: "sunflower"
			end

			it "should create user" do
				expect{ click_button submit }.to change(User, :count).by(1)
			end

			describe "after create user" do
				before {click_button submit}

				let(:user) {User.find_by(email: "v.handed@gmail.com")}

				it {should have_link 'Sign out'}
				it {should have_title (user.name)}
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
			end

		end

		describe "with invalid information" do

			it "should not create user" do
				expect { click_button submit }.not_to change(User, :count)
			end

		end

	end


	describe "profile page" do

		let(:user) { FactoryGirl.create(:user) }

		before { visit user_path(user) }

		it { should have_content(user.name) }
		it { should have_title(user.name) }

	end





end
