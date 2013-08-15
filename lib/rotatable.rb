module Rotatable
  attr_reader :operator, :rotation_num

  def rotx(rotation_num, string, cipher=:encrypt)
    validate_args rotation_num, cipher

    string.chars.map do |char|
      rotate char
    end.join
  end

  private

  def validate_args(rotation_num, cipher)
    raise ArgumentError, "cipher must be :encript or :descrypt" if ![:encrypt, :decrypt].include? cipher
    @operator = cipher == :encrypt ? '+' : '-'

    begin
      @rotation_num = Integer rotation_num
      raise if @rotation_num < 0
    rescue
      raise ArgumentError, 'rotation num must be zero or positive integer'
    end
  end

  def alphas
    @_alphas ||= ('a'..'z').to_a
  end

  def rotate(char)
    index = alphas.index char.downcase
    if !!index
      rotated = alphas[(index.send(operator, rotation_num))%26]
      char == char.downcase ? rotated : rotated.upcase
    else
      char
    end
  end
end


class Object
  include Rotatable
end