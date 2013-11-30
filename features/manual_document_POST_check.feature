Feature: 

  As a manager
  I want users to have to go through the proper form to upload documents
  So that the document flow for submissions is followed without being subverted


Scenario: public users cannot create published documents via manual HTTP POST requests
  Given I am not signed in
  When I submit a manual POST request to create a published picture document named "TestPicture"
  Then the picture document named "TestPicture" should not exist

Scenario: public users cannot edit existing documents via manual HTTP POST requests
  Given I am not signed in
  And there is a video named "TestVideo"
  When I submit a manual POST request to edit a video named "TestVideo"
  Then I should be on the login pagen


Scenario: editors cannot edit existing documents via manual HTTP POSTs to make them published
  Given I am signed in as an editor
  And there is a sound named "TestSound"
  And all the translations of the sound named "TestSound" are pending
  When I submit a manual POST request to publish a sound named "TestSound"
  Then I should see "Editors cannot publish documents"

Scenario: editors cannot edit an already published document
  Given I am signed in as an editor
  And there is a binary named "TestBinary"
  And all the translations of the binary named "TestBinary" are published
  When I submit a manual POST request to edit a sound named "TestBinary"
  Then I should see "Editors cannot edit published documents"
