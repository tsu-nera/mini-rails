require_relative 'spec_helper'

require 'active_record'
require 'muffin_blog/app/models/application_record'
require 'muffin_blog/app/models/post'

RSpec.describe 'ActiveRecord' do
  let(:post) { Post.new(id: 1, title: 'My first post') }

  it '#initialize' do
    expect(post.id).to eq(1)
    expect(post.title).to eq('My first post')
  end
end
