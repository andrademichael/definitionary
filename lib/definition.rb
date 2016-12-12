class Definition

  @definitions = []
  attr_reader :definition

  define_method(:initialize) do |definition_text|
    @definition = definition_text
  end
end
