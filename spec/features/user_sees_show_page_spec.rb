require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays information from one article' do
      article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")

      visit articles_path
      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
