require 'spec_helper'

describe "Static pages" do
  
  let(:base_title) {"Ruby on Rails Tutorial Sample App"}
  subject {page}

  describe "Home page" do

    before {visit root_path}

    it "should have the content 'Sample App'" do
      should have_content('Sample App')
    end

    it "should have the base title" do
      should have_title("#{base_title}")
    end

    it "should have the title home" do
    	should_not have_title("Home")
    end
  end

  describe "Help page" do
  	
  	it "should have the content 'Help'" do
  		visit help_path
  		should have_title("#{base_title} | Help")
  	end
  end

  describe "About page" do

  	it "should have the content 'About Us'" do
  		visit about_path
  		should have_title("#{base_title} | About Us")
  	end
  end

  describe "Contact" do
  	it "should have the title 'Contact'" do
  		visit contact_path
  		should have_title("#{base_title} | Contact")
  	end
  end



end