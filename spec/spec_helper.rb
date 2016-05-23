$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'password'

RSpec::Matchers.define :have_lowercase_characters do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[a-z]/) }.compact!

    found.nil? ? true : false
  end
end

RSpec::Matchers.define :have_uppercase_characters do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[A-Z]/) }.compact!

    found.nil? ? true : false
  end
end

RSpec::Matchers.define :have_numeric_characters do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[0-9]/) }.compact!

    found.nil? ? true : false
  end
end

RSpec::Matchers.define :include_numeric_characters do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[0-9]/) }.compact!

    found.empty? ? false : true
  end
end
RSpec::Matchers.define :have_special_character do |expected|
  match do |actual|
    found = actual.chars.collect { |character| character.match(/[!$%&*@^]/) }.compact!

    found.nil? ? true : false
  end
end
