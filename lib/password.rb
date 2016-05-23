class Password
  def self.generate(length=8, options={lowercase: true, uppercase: true, numeric: true, special: true})
    password = []

    password_combo = []
    if options[:uppercase]
      password_combo.concat(uppercase)
    end

    if options[:lowercase]
      password_combo.concat(lowercase)
    end

    if options[:numeric]
      password_combo.concat(numeric)
    end

    if options[:special]
      password_combo.concat(special)
    end

    length.times do
      password << password_combo[rand(password_combo.size)]
    end

    password.join
  end

  protected

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
