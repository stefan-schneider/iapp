require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "Home page" do  
    before { visit root_path }  
    
    it { should have_content('iApp') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

  end
  
  describe "Help page" do   
    before { visit help_path } 
    
    it { should have_content('help') }
    it { should have_title(full_title('Help')) } 
  end
  
  describe "About page" do  
    before { visit about_path }  
    
    it { should have_content('about') }
    it { should have_title(full_title('About')) }   
  end
  
  describe "Contact page" do    
    before { visit contact_path }

    it { should have_content('contact') }
    it { should have_title(full_title('Contact')) }  
  end
end
