module StringHelper
  # Parameterize a string
  def parameterize(string)
    string = string.to_s

    # Turn unwanted chars into the separator.
    string.gsub!(/[^a-z0-9\-_]+/i, '-')
    string.downcase!

    string
  end
end
