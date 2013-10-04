require 'spec_helper'

describe "picture_langs/new" do
  before(:each) do
    assign(:picture_lang, stub_model(PictureLang).as_new_record)
  end

  it "renders new picture_lang form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", picture_langs_path, "post" do
    end
  end
end
