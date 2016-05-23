class Password
  def self.generate(length=8)
    password = []

    length.times do
      password << lowercase[rand(24)]
    end

    password.join
  end

  protected

  def self.lowercase
    ('a'..'z').to_a
  end
end
