require 'spec_helper'

RSpec::Matchers.define :be_lowercase do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[a-z]/) }.compact!

    found.nil? ? true : false
  end
end

describe Password do
  subject { described_class }

  it 'requires a password length' do
    expect(subject.generate(10).chars.count).to eql(10)
  end

  context 'passwords with lowercase characters' do
    it 'returns a password with lowercase characters' do
      expect(subject.generate).to be_lowercase
    end
  end

  context 'passwords with lowercase characters' do
  end

  context 'passwords with uppercase characters' do
    it 'returns a password with uppercase characters'
  end

  context 'passwords with numbers' do
    it 'returns a password with numbers'
  end

  context 'passwords with special characters' do
    it 'returns a password with special characters'
  end
end
