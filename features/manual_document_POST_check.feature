Feature: 

  As a manager
  I want users to have to go through the proper form to upload documents
  So that the document flow for submissions is followed without being subverted


Scenario: public users cannot edit existing documents via manual HTTP POST requests
  Given I am not signed in
  And there is a video named "TestVideo"
  When I submit a manual POST request to edit a video named "TestVideo"
  Then I should be on the login page


Scenario: editors cannot edit existing documents via manual HTTP POSTs to make them published
  Given I am signed in as an editor
  And there is a sound named "TestSound"
  And all the translations of the sound named "TestSound" are pending
  When I submit a manual POST request to mark a sound named "TestSound" as published
  Then I should see "Editors cannot publish or unpublish documents"

Scenario: editors cannot use manual HTTP POSTs to unpublish documents
  Given I am signed in as an editor
  And there is a picture named "TestPicture"
  And all the translations of the picture named "TestPicture" are published
  When I submit a manual POST request to mark a picture named "TestPicture" as new
  Then I should see "Editors cannot publish or unpublish documents"

Scenario: editors cannot edit an already published document
  Given I am signed in as an editor
  And there is a binary named "TestBinary"
  And all the translations of the binary named "TestBinary" are published
  When I submit a manual POST request to edit a binary named "TestBinary"
  Then I should see "Editors cannot edit published documents"
