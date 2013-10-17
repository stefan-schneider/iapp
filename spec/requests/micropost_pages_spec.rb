require 'spec_helper'

describe "Micropost pages" do
  
  subject { page }
  
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  describe "micropost creation" do
    before { visit root_path }
    
    describe "with invalid information" do
      it "should not create a micropost" do
        expect { click_button "Post" }.not_to change(Micropost, :count)
      end
      
      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end
    
    describe "with valid information" do
      before { fill_in 'micropost_content', with: "Content goes here" }
      it "should create a micropost" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end

  describe "micropost destruction" do
    before { FactoryGirl.create(:micropost, user: user) }
    
    describe "as correct user" do
      before { visit root_path }
      
      it "should delete a micropost" do
        expect { click_link "delete" }.to change(Micropost, :count).by(-1)
      end
    end
  end
  
  describe "foreign users" do
    let(:foreign_user) { FactoryGirl.create(:user) }
    
    describe "microposts" do
      before do
        FactoryGirl.create(:micropost, user: foreign_user, content: "Foreign post")
        visit user_path(foreign_user)
      end
    
      it "should not have a delete link" do
        expect(page).to_not have_link('delete')
      end
    end
  end
    
end
