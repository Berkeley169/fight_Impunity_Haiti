require 'spec_helper'

describe "documents/new" do
  before(:each) do
    assign(:document, stub_model(Document,
      :name => "MyString",
      :english => false,
      :french => false,
      :creole => false,
      :spanish => false
    ).as_new_record)
  end

  it "renders new document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", documents_path, "post" do
      assert_select "input#document_name[name=?]", "document[name]"
      assert_select "input#document_english[name=?]", "document[english]"
      assert_select "input#document_french[name=?]", "document[french]"
      assert_select "input#document_creole[name=?]", "document[creole]"
      assert_select "input#document_spanish[name=?]", "document[spanish]"
    end
  end
end
