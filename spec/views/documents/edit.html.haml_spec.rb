require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :name => "MyString",
      :english => false,
      :french => false,
      :creole => false,
      :spanish => false
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", document_path(@document), "post" do
      assert_select "input#document_name[name=?]", "document[name]"
      assert_select "input#document_english[name=?]", "document[english]"
      assert_select "input#document_french[name=?]", "document[french]"
      assert_select "input#document_creole[name=?]", "document[creole]"
      assert_select "input#document_spanish[name=?]", "document[spanish]"
    end
  end
end
