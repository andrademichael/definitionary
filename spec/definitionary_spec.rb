
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

  describe("#initialize") do
    it("creates new Word object") do
      test_def1 = Definition.new("word1 is a test word")
      test_word1 = Word.new({:spelling=> "word", :meaning=>  test_def1, :pronounciation=> "wɜːd", :lexical_class=> "noun"})
      expect(test_word1).to(eq(test_word1))
    end
  end

end
