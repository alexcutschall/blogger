require 'rails_helper'

describe 'user sees one article' do
  describe 'they link from the articles index' do
    it 'displays information from one article' do
      article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")
      comment_1 = article_1.comments.create!(author_name: "Kendrick Lamar", body: "This is the best article")
      comment_2 = article_1.comments.create!(author_name: "Kanye West", body: "Yes, it is")

      visit articles_path
      click_link article_1.title

      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
      expect(page).to have_link("<< Back to Articles List")
      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)
      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end
end
