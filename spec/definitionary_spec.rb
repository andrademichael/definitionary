
require('rspec')
require('word')
require('definition')

describe(Definition) do

  describe("#initialize") do
    it("creates new Definition object") do
      test_def1 = Definition.new("word1 is a test word")
      expect(test_def1.definition).to(eq("word1 is a test word"))
    end
  end
end

describe(Word) do

  test_def1 = Definition.new("word1 is a test word")
  test_word1 = Word.new({:spelling=> "wordone", :meaning=>  test_def1, :pronounciation=> "wɜːd1", :lexical_class=> "noun"})
  test_def2 = Definition.new("word2 is also a test word")
  test_word2 = Word.new({:spelling=> "wordtwo", :meaning=>  test_def2, :pronounciation=> "wɜːd2", :lexical_class=> "noun"})


  describe("#initialize") do
    it("creates new Word object") do
      expect(test_word1).to(eq(test_word1))
    end
  end

  describe("#define") do
    it("adds a definition string to the word's definitions array") do
      test_word1.define(test_def1)
      expect(test_word1.definitions).to(eq([test_def1]))
    end
  end

  describe(".all") do
    it("returns the array of all created words") do
      expect(Word.all).to(eq([test_word1, test_word2]))
    end
  end

  describe(".alphabetize") do
    it("sorts the @@words array alphabetically") do
      test_word3 = Word.new({:spelling=> "awordthree", :meaning=>  test_def1, :pronounciation=> "wɜːd1", :lexical_class=> "noun"})
      test_def3 = Definition.new("word3 is a test word that is first alphabetically.")
      Word.alphabetize
      expect(Word.all).to(eq([test_word3, test_word1, test_word2]))
    end
  end
end
