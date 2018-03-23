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
    describe 'user fills in the comment section' do
      it 'displays the comment on the article show' do
        article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")

        visit article_path(article_1)

        fill_in "comment[author_name]", with: "Kendrick Lamar"
        fill_in "comment[body]", with: "Cause it's great"
        click_on "Submit"

        expect(current_path).to eq(article_path(article_1))
        expect(page).to have_content("Post a comment")
        expect(page).to have_content("Kendrick Lamar")
        expect(page).to have_content("Cause it's great")
        expect(page).to have_content("Comments(#{article_1.comments.size})")
      end
    end
  end
end
