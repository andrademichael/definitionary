class Word

  @@words = []

  attr_reader :spelling, :definitions, :id

  define_method(:initialize) do |attributes|
    @spelling = attributes.fetch(:spelling)
    @definitions = []
    @id = @@words.length + 1
    @@words.push(self)
  end

  define_method(:define_word) do |definition_text|
    @definitions.push(definition_text)
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

  define_singleton_method(:find) do |search_id|
    found_word = nil
    @@words.each() do |word|
      if word.id.eql?(search_id.to_i())
       found_word = word
      end
    end
    found_word
  end
end
