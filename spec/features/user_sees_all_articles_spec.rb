require "rails_helper"
describe "user sees all articles" do
  describe "they visit /articles" do
    it "displays all articles" do
    article_1 = Article.create!(title: "Why Hip Hop Matters", body: "Because it's awesome")
    article_2 = Article.create!(title: "Why Jazz Matters", body: "Because of it's unbridled expression")
    visit '/articles'

    expect(page).to have_content(article_1.title)
    expect(page).to have_content(article_2.title)
    end
  end
end
