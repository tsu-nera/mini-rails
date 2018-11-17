require_relative 'spec_helper'

require 'active_record'
require 'muffin_blog/app/models/application_record'
require 'muffin_blog/app/models/post'

RSpec.describe 'ActiveRecord' do
  before do
    Post.establish_connection(
        database: "#{__dir__}/muffin_blog/db/development.sqlite3")
  end

  describe "#initialize" do
    let(:post) { Post.new(id: 1, title: 'My first post') }

    it 'pass' do
      expect(post.id).to eq(1)
      expect(post.title).to eq('My first post')
    end
  end

  describe '#find' do
    let(:post) { Post.find(1) }

    it 'pass' do
      expect(post).kind_of? Post
      expect(post.id).to eq(1)
      expect(post.title).to eq('Blueberry Muffins')
    end
  end

  describe "#all" do
    let(:post) { Post.all.first }

    it 'pass' do
      expect(post).kind_of? Post
      expect(post.id).to eq(1)
      expect(post.title).to eq('Blueberry Muffins')
    end
  end

  describe "#execute_sql" do
    it 'pass' do
      rows = Post.connection.execute('SELECT * FROM posts')
      expect(rows).kind_of? Array
      row = rows.first
      expect(row).kind_of? Hash
      expect(row.keys).to eq([:id, :title, :body, :created_at, :updated_at])
    end
  end

  describe "#where" do
    it "generate sql" do
      relation = Post.where("id = 2").where("title IS NOT NULL")
      expect(relation.to_sql).to eq("SELECT * FROM posts WHERE id = 2 AND title IS NOT NULL")
      post = relation.first
      expect(post.id).to eq(2)
    end
  end
end
