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

  define_method(:edit_word) do |word, attributes|
    @spelling = attributes.fetch(:spelling)
    @meaning = attributes.fetch(:meaning)
    @pronounciation = attributes.fetch(:pronounciation)
    @lexical_class = attributes.fetch(:lexical_class)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:alphabetize) do
    @@words.sort_by! do |word|
      word.spelling.downcase
    end
  end
end
