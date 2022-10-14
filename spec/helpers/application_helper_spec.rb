require 'rails_helper'

RSpec.describe ApplicationHelper do
  it 'can format an integer duration to hours and minutes' do
    expect(runtime_view_helper(120)).to eq("2hrs")
    expect(runtime_view_helper(60)).to eq("1hr")
    expect(runtime_view_helper(85)).to eq("1hr 25mins")
    expect(runtime_view_helper(50)).to eq(" 50mins")
    expect(runtime_view_helper(191)).to eq("3hrs 11mins")
  end
end