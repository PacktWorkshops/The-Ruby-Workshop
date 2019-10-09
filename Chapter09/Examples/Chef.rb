module Chef
  def self.included(klass)
    puts "The Chef is ready for service!"
end
  def recipes
    @recipes ||= {}
  end
  def before_filter
    @before_filter ||= {}
  end
  def after_filter
    @after_filter ||= {}
  end
  def cook(recipe, &block)
    puts "Define the ingredients for the recipe: #{recipe}"
    recipes[recipe] = block
  end
  def before(recipe, &block)
    puts "Performing pre cooking steps for recipe: #{recipe}"
    before_filter[recipe] = block
  end
  def after(recipe, &block)
    puts "Performing post cooking steps for recipe: #{recipe}"
    after_filter[recipe] = block
  end
  def run(recipe)
    if recipes.has_key?(recipe)
        before_filter[recipe].call
        recipes[recipe].call
        after_filter[recipe].call
    else
        raise StandardError.new("The recipe is unknown")
    end
  end
end
include Chef