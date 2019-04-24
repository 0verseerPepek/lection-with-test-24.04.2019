require 'rails_helper'

RSpec.describe UserparamController, type: :controller do

    let!(:user) { build(:userparam, firstname: "tester", lastname: "testerow", age: 10) }

    sign_in
    
      describe 'GET action #new' do
        it "should find current_user and open form for create userparam" do
          get :new
          expect(subject.current_user.userparam.firstname).to eq("tester")
          expect(subject.current_user.userparam.age).to eq(10)
          expect(subject.current_user.userparam.lastname).to eq(user.userparam.lastname)
          expect(response).to have_http_status(200)     
        end
      end
    
      describe 'POST action #create' do
        it "should create userparam and redirect to index page" do
          post :create, params: {userparam: {firstname:"Tester", lastname: "Testing", age: 11} }
          expect(subject.current_user.userparam.firstname).to eq("Tester")
          expect(subject.current_user.userparam.lastname).to eq("Testing")
          expect(subject.current_user.userparam.age).to eq(11)
          expect(response).to redirect_to root_path
        end
      end
    
end

