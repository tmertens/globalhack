class Normalize

  def self.call(value)
    value.to_s.strip.squeeze(' ').downcase
  end

  def initialize
    raise NotImplementedError
  end

end
