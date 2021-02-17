require 'rails_helper'

RSpec.describe "records/index", type: :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        :user_id => 2
      ),
      Record.create!(
        :user_id => 2
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
