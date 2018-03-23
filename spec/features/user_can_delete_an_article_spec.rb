require 'rails_helper'

describe "user can delete an article" do
  describe "user visits a show page" do
    it "can delete an article" do
      article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")
      article_2 = Article.create!(title: "Why Jazz Matters", body: "Cause it's Jazz")

      visit article_path(article_1)
      click_link "Delete"

      expect(current_path).to eq(articles_path)
      expect(page).to have_content(article_2.title)
      expect(page).to have_content("Article Why Hip Hop Matters was deleted!")
    end
  end
end
