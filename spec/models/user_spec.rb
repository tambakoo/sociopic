require 'rails_helper'

RSpec.describe User, type: :model do
		
  describe "Validations" do 
		it "is invalid with invalid attributes" do
	    expect(User.new).to_not be_valid
	  end

	  it "is not valid without an email" do
	  	user = User.new(password: "password")
	  	expect(user).to_not be_valid
	  end

	  it "is not valid without a password" do
	  	user = User.new(email: "abc@gm.com")
	  	expect(user).to_not be_valid
	  end
  end


  describe "Associations" do
	  it "has_many pictures" do
	    assc = described_class.reflect_on_association(:pictures)
	    expect(assc.macro).to eq :has_many
	  end

	  it "has_many active_relationships " do
	    assc = described_class.reflect_on_association(:active_relationships)
	    expect(assc.macro).to eq :has_many
	  end

	  it "has_many passive_relationships" do
	    assc = described_class.reflect_on_association(:passive_relationships)
	    expect(assc.macro).to eq :has_many
	  end

	  it "has_many followers" do
	    assc = described_class.reflect_on_association(:followers)
	    expect(assc.macro).to eq :has_many
	  end

	  it "has_many following " do
	    assc = described_class.reflect_on_association(:following)
	    expect(assc.macro).to eq :has_many
	  end
	end

end