require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
    build(:user)
  }

  describe "validation" do
    it "should not be valid without userparam" do
      subject.userparam.firstname = nil
      subject.userparam.lastname = nil
      subject.userparam.age = nil
      subject.userparam.user_id = nil
      expect(subject).to_not be_valid
   end
    it { should validate_presence_of(:userparam) }
  end

  describe "Associations" do
    it { should have_one(:userparam)}
    it { should have_many(:posts) }
    it { should have_many(:post_comments) }
    it { should have_many(:photos) }
  end
end
