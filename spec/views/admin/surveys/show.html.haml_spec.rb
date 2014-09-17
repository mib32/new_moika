require 'spec_helper'

describe "admin/surveys/show" do
  before(:each) do
    @admin_survey = assign(:admin_survey, stub_model(Admin::Survey,
      :question => "Question",
      :answer_1 => "Answer 1",
      :answer_2 => "Answer 2",
      :answer_3 => "Answer 3",
      :answer_4 => "Answer 4",
      :answer_5 => "Answer 5"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    rendered.should match(/Answer 1/)
    rendered.should match(/Answer 2/)
    rendered.should match(/Answer 3/)
    rendered.should match(/Answer 4/)
    rendered.should match(/Answer 5/)
  end
end
