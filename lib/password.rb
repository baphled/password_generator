class Password
  def self.generate(length=8)
    password = []

    length.times do
      password << 'a'
    end

    password.join
  end
end
