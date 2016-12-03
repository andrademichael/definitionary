class Word

  @@words = []
  attr_reader :spelling, :meaning, :pronounciation, :lexical_class, :id

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @meaning = attributes.fetch(:meaning)
    @pronounciation = attributes.fetch(:pronounciation)
    @lexical_class = attributes.fetch(:lexical_class)
    @id = @@words.length + 1
    @@words.push(self)
  end
end
