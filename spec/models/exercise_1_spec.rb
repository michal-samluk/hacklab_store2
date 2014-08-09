require "rails_helper"

describe "Exercise 1", :type => :model do
  fixtures :all

  it "Find all accounts with credits less than $40, order by first_name, last_name" do
    expect(Account.with_less_than_400_credits.count).to eq(70)
  end

  it "Find all users with credits less than $40 that has created account after 6th, August" do
    expect(User.credits_less_than(400).recent_users.count).to eq(22)
  end

  it "Count how many users were created in each of the days, ordered by date ASC" do
    expect(User.grouped_by_day_counts.map(&:count).sort).to eq([14, 14, 15, 17, 17, 17, 19, 25, 28, 34] )
  end

end