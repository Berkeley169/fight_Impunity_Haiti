require 'spec_helper'

describe "picture_langs/index" do
  before(:each) do
    assign(:picture_langs, [
      stub_model(PictureLang),
      stub_model(PictureLang)
    ])
  end

  it "renders a list of picture_langs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
