require "application_system_test_case"

class SubjectsTest < ApplicationSystemTestCase
  setup do
    @subject = subjects(:one)
  end

  test "creating a Subject" do
    visit subjects_url
    click_on "Tárgy létrehozás"

    fill_in "Név", with: @subject.name
    fill_in "Kredit", with: @subject.credit
    click_on "new-course-button"
    click_on "Létrehoz"

    assert_text "Sikeres tárgy létrehozás!"
  end
end
