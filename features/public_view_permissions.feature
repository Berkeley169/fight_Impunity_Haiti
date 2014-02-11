Feature: Public can only view published translations

  As an editor/manager
  I want public users to only see published translations of documents
  So that I can complete my translation work and only make it public once a manager deems it satisfactory

Background:
  When I click English
  Given there is a picture named "TestPic1"
  And there is a picture named "TestPic2"
  And there is a newspaper article text named "TestNews"
  And there is a sound named "TestSound"
  And I set the status of the English translation of the picture "TestPic1" to "published"
  And I set the status of the French translation of the picture "TestPic1" to "in_progress"
  And I set the status of the English translation of the picture "TestPic2" to "pending"
  And I set the status of the Creole translation of the text "TestNews" to "published"
  And I set the status of the Spanish translation of the text "TestNews" to "in_progress"


Scenario: the public does not see unpublished translations
  Given I am on the show picture page for "TestPic1"
  Then I should not see "French"
  And I should not see "Creole"
  And I should not see "Spanish"

Scenario: documents with no published translations do not appear on the index page
  Given I am on the sound index page
  Then I should not see "TestSound"
