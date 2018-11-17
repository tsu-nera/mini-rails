require_relative 'spec_helper'

RSpec.describe 'ActiveRecord' do
  let(:post) { Post.new(id: 1, title: 'My first post') }

  it 'first spec' do
    expect(post.id).to eq(1)
    expect(post.title).to eq('My first post')
  end
end
