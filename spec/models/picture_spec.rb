require 'rails_helper'

RSpec.describe Picture, type: :model do
	subject {
	@user = User.new(email: "hello@gmail.com", password: "password")
    described_class.new(user: @user, pic_file_name: "blablablab", 
    										pic_content_type: "someting", 
												pic_file_size: 1234, pic_updated_at: Time.now)
  }

	it "is not valid for non image content type" do
  	expect(subject).to_not be_valid
	end

	it "is valid for only image/jpeg type content" do
		subject.pic_content_type = "image/jpeg"
		expect(subject).to be_valid
	end

  it "belongs to user" do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

end