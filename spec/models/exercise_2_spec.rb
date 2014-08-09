require "rails_helper"

describe "Exercise 2", :type => :model do
  fixtures :all

  it "Count items that were ordered" do
    expect(Item.ordered.count).to eq(10)
  end

  it "Count items that were unordered" do
    expect(Item.unordered.count).to eq(10)
  end

end