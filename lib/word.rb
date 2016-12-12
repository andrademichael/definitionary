class Word

  @@words = []
  attr_reader :spelling, :definitions, :id

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @definitions = []
    @id = @@words.length + 1
    @@words.push(self)
  end

  define_method(:define) do |definition|
    @definitions.push(definition)
  end

  define_method(:==) do |word1, word2|
    word1.spelling == word2.spelling
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
