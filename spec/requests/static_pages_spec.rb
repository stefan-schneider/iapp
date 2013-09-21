require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do    
    it "should have the content 'iApp'" do
      visit '/static_pages/home'
      expect(page).to have_content('iApp')
    end
    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title('iApp')
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
  
  describe "Help page" do    
    it "should have the content 'help'" do
      visit '/static_pages/help'
      expect(page).to have_content('help')
    end
    it "should have the right title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title('iApp | Help')
    end    
  end
  
  describe "About page" do    
    it "should have the content 'about'" do
      visit '/static_pages/about'
      expect(page).to have_content('about')
    end
    it "should have the right title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title('iApp | About')
    end    
  end
  
  describe "Contact page" do    
    it "should have the content 'contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('contact')
    end
    it "should have the right title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title('iApp | Contact')
    end    
  end
end
