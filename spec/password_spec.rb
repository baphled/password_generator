require 'spec_helper'

RSpec::Matchers.define :be_lowercase do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[a-z]/) }.compact!

    found.nil? ? true : false
  end
end

RSpec::Matchers.define :be_uppercase do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[A-Z]/) }.compact!

    found.nil? ? true : false
  end
end

RSpec::Matchers.define :be_numeric do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[0-9]/) }.compact!

    found.nil? ? true : false
  end
end

RSpec::Matchers.define :be_special_character do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[!$%&*@^]/) }.compact!

    found.nil? ? true : false
  end
end

describe Password do
  subject { described_class }

  it 'has a default length'
  it 'requires a password length' do
    expect(subject.generate(10).chars.count).to eql(10)
  end

  context 'a single option is chosen' do

    context 'passwords with lowercase characters' do
      let(:options) { {lowercase: true, uppercase: false} }

      it 'returns a password with lowercase characters' do
        expect(subject.generate(10, options)).to be_lowercase
      end
    end

    context 'passwords with uppercase characters' do
      let(:options) { {lowercase: false, uppercase: true} }

      it 'returns a password with uppercase characters' do
        expect(subject.generate(10,options)).to be_uppercase
      end
    end

    context 'passwords with numbers' do
      let(:options) { {lowercase: false, uppercase: false, numeric: true} }

      it 'returns a password with numbers' do
        expect(subject.generate(10,options)).to be_numeric
      end
    end

    context 'passwords with special characters' do
      let(:options) { {lowercase: false, uppercase: false, numeric: false, special: true} }

      it 'returns a password with special characters' do
        expect(subject.generate(10,options)).to be_special_character
      end
    end
  end
end
