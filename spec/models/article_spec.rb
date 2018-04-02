require 'rails_helper'

describe Article, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:body)}
  end
  describe 'relationships' do
    it {should have_many(:comments)}
  end
  describe 'class methods' do
    describe '#tag_list' do
      it "turns associated tags into a string" do
        article = Article.create(title: "Cars 3", body: "Who made this?")
        article.tags.create(name: "Animated")
        article.tags.create(name: "Family")

        expect(article.tag_list).to eq("Animated, Family")
      end
    end
  end
end
