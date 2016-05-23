class Password
  def self.generate(length=8, options={lowercase: true, uppercase: true, numeric: true, special: true})
    password = []


    if options[:uppercase]
      length.times do
        password << uppercase[rand(24)]
      end
    elsif options[:lowercase]
      length.times do
        password << lowercase[rand(24)]
      end
    elsif options[:numeric]
      length.times do
        password << numeric[rand(24)]
      end
    elsif options[:special]
      length.times do
        password << special[rand(24)]
      end
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
