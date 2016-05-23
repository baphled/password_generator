class Password
  def self.generate(length=8, options={lowercase: true, uppercase: true, numeric: true, special: true})
    password = []

    characters = password_characters(options)
    length.times { password << characters[rand(characters.size)] }

    password.join
  end

  protected

  def self.password_characters(options)
    password_characters = []

    password_characters.concat(uppercase) if options[:uppercase]
    password_characters.concat(lowercase) if options[:lowercase]
    password_characters.concat(numeric) if options[:numeric]
    password_characters.concat(special) if options[:special]

    password_characters
  end

  def self.lowercase
    ('a'..'z').to_a
  end

  def self.uppercase
    ('A'..'Z').to_a
  end

  def self.numeric
    (0..9).to_a
  end

  def self.special
    "!$%&*@^".chars
  end
end
