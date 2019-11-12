require 'rails_helper'

RSpec.describe Relationship, type: :model do
	subject {
	@user1 = User.create(email: "hello@gmail.com", password: "password")
	@user2 = User.create(email: "abc@gmail.com", password: "password")
    described_class.new(follower: @user1, followed: @user2)
  }

describe "Validations" do 
	it "must have a follower and followed" do
  	expect(subject).to be_valid
	end

	it "is not valid without a follower " do
		subject.follower = nil
  	expect(subject).to_not be_valid
	end

	it "is not valid without a followed " do
		subject.followed = nil
  	expect(subject).to_not be_valid
	end
end

describe "Associations" do 
 it "belongs_to follower" do
    assc = described_class.reflect_on_association(:follower)
    expect(assc.macro).to eq :belongs_to
  end

   it "belongs_to following" do
    assc = described_class.reflect_on_association(:followed)
    expect(assc.macro).to eq :belongs_to
	end
end



end
