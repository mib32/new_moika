require 'spec_helper'

describe "reviews/edit" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :text => "MyString",
      :rating => 1,
      :car_wash => nil
    ))
  end

  it "renders the edit review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", review_path(@review), "post" do
      assert_select "input#review_text[name=?]", "review[text]"
      assert_select "input#review_rating[name=?]", "review[rating]"
      assert_select "input#review_car_wash[name=?]", "review[car_wash]"
    end
  end
end
