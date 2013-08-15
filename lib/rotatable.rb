module Rotatable
  attr_reader :operator, :positions

  def rotx(positions, string, cipher=:encrypt)
    validate_args positions, cipher

    string.chars.map do |char|
      rotate char
    end.join
  end

  private

  def validate_args(positions, cipher)
    raise ArgumentError, "cipher must be :encript or :descrypt" if ![:encrypt, :decrypt].include? cipher
    @operator = cipher == :encrypt ? '+' : '-'

    begin
      @positions = Integer positions
      raise if @positions < 0
    rescue
      raise ArgumentError, 'positions must be non-negative integer'
    end
  end

  def alphas
    @_alphas ||= ('a'..'z').to_a
  end

  def rotate(char)
    index = alphas.index char.downcase
    if !!index
      rotated = alphas[(index.send(operator, positions))%26]
      char == char.downcase ? rotated : rotated.upcase
    else
      char
    end
  end
end


class Object
  include Rotatable
end