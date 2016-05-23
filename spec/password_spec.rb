require 'spec_helper'

describe Password do
  let(:password_length) { 10 }

  subject { described_class }

  it 'has a default length' do
    expect(subject.generate.chars.count).to eql(8)
  end

  it 'requires a password length' do
    expect(subject.generate(password_length).chars.count).to eql(password_length)
  end

  context 'a single option is chosen' do
    context 'passwords with lowercase characters' do
      let(:options) { {lowercase: true, uppercase: false, numeric: false, special: false} }

      it 'only has lowercase characters' do
        expect(subject.generate(password_length, options)).to have_lowercase_characters
      end

      it 'does not include uppercase characters' do
        expect(subject.generate(password_length,options)).not_to have_uppercase_characters
      end

      it 'does not include numeric characters' do
        expect(subject.generate(password_length,options)).not_to have_numeric_characters
      end

      it 'does not include special characters' do
        expect(subject.generate(password_length,options)).not_to have_special_characters
      end
    end

    context 'passwords with uppercase characters' do
      let(:options) { {lowercase: false, uppercase: true} }

      it 'only has uppercase characters' do
        expect(subject.generate(password_length,options)).to have_uppercase_characters
      end
    end

    context 'passwords with numbers' do
      let(:options) { {lowercase: false, uppercase: false, numeric: true} }

      it 'only has number numbers' do
        expect(subject.generate(password_length,options)).to have_numeric_characters
      end
    end

    context 'passwords with special characters' do
      let(:options) { {lowercase: false, uppercase: false, numeric: false, special: true} }

      it 'returns a password with special characters' do
        expect(subject.generate(password_length,options)).to have_special_characters
      end
    end
  end

  context 'a combination of options are passed' do
    let(:options) { {lowercase: true, uppercase: true, numeric: true, special: true} }

    subject { described_class.generate(password_length, options) }

    it 'returns the expect number of characters' do
      expect(subject.size).to eql(password_length)
    end

    it 'includes numbers' do
      expect(subject).to include_numeric_characters
    end

    it 'includes uppercase characters' do
      expect(subject).to include_uppercase_characters
    end

    it 'includes lowercase characters' do
      expect(subject).to include_lowercase_characters
    end

    it 'includes special characters' do
      expect(subject).to include_special_characters
    end
  end
end
