class CategoryController < Controller
  attr_accessor :category

  def run
    get_input :category, "What is the category name? "

    self.voting_machine.add_category(@category)

    log "Category added!"
  end
end
