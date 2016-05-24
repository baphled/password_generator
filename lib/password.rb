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

    [:uppercase, :lowercase, :numeric, :special].each do |character_type|
      password_characters.concat(self.send(character_type)) if options[character_type]
    end.compact!

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
