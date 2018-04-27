module RockPaperScissors
  class UnknownSign < StandardError
    def initialize(sign)
      super("Unknown sign #{sign}")
    end
  end

  class Game
    SIGNS = {
      paper: { beats: [:rock] },
      scissors: { beats: [:paper] },
      rock: { beats: [:scissors] }
    }

    attr_reader :sign1, :sign2

    def self.signs
      SIGNS.keys
    end

    def initialize(sign1, sign2)
      check_signs([sign1, sign2])

      @sign1 = sign1
      @sign2 = sign2
    end

    def result
      return @result if instance_variable_defined?(:@result)

      return @result = :win if first_beats?(sign1, sign2)
      return @result = :loss if first_beats?(sign2, sign1)
      @result = :tie if sign1 == sign2
    end

    private

    def first_beats?(_sign1, _sign2)
      SIGNS[_sign1][:beats].include?(_sign2)
    end

    def check_signs(signs)
      signs.each { |sign| raise UnknownSign.new(sign) unless self.class.signs.include?(sign) }
    end
  end
end
