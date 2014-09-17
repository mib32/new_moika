require 'spec_helper'

describe "admin/surveys/new" do
  before(:each) do
    assign(:admin_survey, stub_model(Admin::Survey,
      :question => "MyString",
      :answer_1 => "MyString",
      :answer_2 => "MyString",
      :answer_3 => "MyString",
      :answer_4 => "MyString",
      :answer_5 => "MyString"
    ).as_new_record)
  end

  it "renders new admin_survey form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_surveys_path, "post" do
      assert_select "input#admin_survey_question[name=?]", "admin_survey[question]"
      assert_select "input#admin_survey_answer_1[name=?]", "admin_survey[answer_1]"
      assert_select "input#admin_survey_answer_2[name=?]", "admin_survey[answer_2]"
      assert_select "input#admin_survey_answer_3[name=?]", "admin_survey[answer_3]"
      assert_select "input#admin_survey_answer_4[name=?]", "admin_survey[answer_4]"
      assert_select "input#admin_survey_answer_5[name=?]", "admin_survey[answer_5]"
    end
  end
end
