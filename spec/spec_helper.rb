$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'password'

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
