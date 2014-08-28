require 'spec_helper'

describe "navs/index" do
  before(:each) do
    assign(:navs, [
      stub_model(Nav,
        :name => "Name",
        :path => "Path",
        :image_url => "Image Url",
        :hidden-xs => false
      ),
      stub_model(Nav,
        :name => "Name",
        :path => "Path",
        :image_url => "Image Url",
        :hidden-xs => false
      )
    ])
  end

  it "renders a list of navs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
