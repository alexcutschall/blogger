require 'rails_helper'

describe 'user sees the create a new article form' do
  describe 'they link from the articles index' do
    it 'creates a new article when form is submitted' do
      article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")

      visit articles_path
      click_link "Create a New Article"

      expect(current_path).to eq(new_article_path)

      fill_in "article[title]", with: "The Incredibles"
      fill_in "article[body]", with: "One of the best animated films"
      fill_in "article[tag_list]", with: "Ruby, Technology"
      click_on "Create Article"

      expect(page).to have_content("The Incredibles")
      expect(page).to have_content("One of the best animated films")
      expect(page).to have_content("Article The Incredibles was created!")
    end
  end
end
