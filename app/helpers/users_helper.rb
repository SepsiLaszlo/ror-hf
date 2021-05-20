module UsersHelper
  def self.generate_neptun
    alfa_numerics = ('A'..'Z').to_a + (1..9).to_a
    Array.new(6).map { alfa_numerics.sample }.join
  end
end
