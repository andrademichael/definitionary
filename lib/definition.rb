class Definition

  attr_reader :text

  define_method(:initialize) do |definition_text|
    @text = definition_text
  end
end
