require 'spec_helper'

describe "admin/surveys/index" do
  before(:each) do
    assign(:admin_surveys, [
      stub_model(Admin::Survey,
        :question => "Question",
        :answer_1 => "Answer 1",
        :answer_2 => "Answer 2",
        :answer_3 => "Answer 3",
        :answer_4 => "Answer 4",
        :answer_5 => "Answer 5"
      ),
      stub_model(Admin::Survey,
        :question => "Question",
        :answer_1 => "Answer 1",
        :answer_2 => "Answer 2",
        :answer_3 => "Answer 3",
        :answer_4 => "Answer 4",
        :answer_5 => "Answer 5"
      )
    ])
  end

  it "renders a list of admin/surveys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    assert_select "tr>td", :text => "Answer 1".to_s, :count => 2
    assert_select "tr>td", :text => "Answer 2".to_s, :count => 2
    assert_select "tr>td", :text => "Answer 3".to_s, :count => 2
    assert_select "tr>td", :text => "Answer 4".to_s, :count => 2
    assert_select "tr>td", :text => "Answer 5".to_s, :count => 2
  end
end
