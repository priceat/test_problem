require 'rails_helper'

RSpec.describe Post, type: :model do

  let(:user) { User.create(first_name: "test", last_name: "user", email: "test@example.com") }
  let(:existing_post) { Post.create(user: user, title: "title", body: "body") }

  it "does not allow posts for a user to have the same title" do
    expect{Post.create(user: user, title: "title", body: "body")}.to_not change{Post.count}
  end

  it "does not have a body longer than 100 characters" do

  end
end
