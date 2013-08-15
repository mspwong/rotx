module Rotatable
  attr_reader :operator, :rotation_num

  def rotx(rotation_num, string, cipher=:encrypt)
    raise ArgumentError if ![:encrypt, :decrypt].include? cipher
    @operator = cipher == :encrypt ? '+' : '-'

    raise ArgumentError if rotation_num.to_i < 0
    @rotation_num = rotation_num

    string.chars.map do |char|
      rotate char
    end.join
  end

  private

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