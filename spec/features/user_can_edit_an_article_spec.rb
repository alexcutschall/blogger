require "rails_helper"

describe "user can edit an article" do
  describe "a user visits an articles show page" do
    it "can edit an article" do
      article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")

      visit article_path(article_1)
      click_link "Edit"

      fill_in "article[title]", with: "Why Rock n Roll Matters"
      click_on "Update Article"

      expect(current_path).to eq(article_path(article_1))
      expect(page).to have_content("Why Rock n Roll Matters")
    end
  end
end
