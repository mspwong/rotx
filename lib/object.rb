class Object
  def rotx(rotation_num, string, cipher=:encrypt)
    raise ArgumentError if ![:encrypt, :decrypt].include? cipher
    operator = cipher == :encrypt ? '+' : '-'

    lower ||= ('a'..'z').to_a
    upper ||= ('A'..'Z').to_a

    string.chars.map do |char|
      if !lower.index(char).nil?
        lower[(lower.index(char).send(operator, rotation_num))%26]
      elsif !upper.index(char).nil?
        upper[(upper.index(char).send(operator, rotation_num))%26]
      else
        char
      end
    end.join
  end
end