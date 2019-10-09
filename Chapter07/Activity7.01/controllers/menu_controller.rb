class MenuController < Controller

  # Store menu of choices in constant
  # This serves as a de-facto router
  # that will serve the code depending on what the user chooses
  MENU_CHOICES = {
    1 => {controller: :vote, label: "Place a vote for a colleague"},
    2 => {controller: :leaderboard, label: "See current leaderboard"},
    3 => {controller: :category, label: "Add category"},
    4 => {controller: :import, label: "Import Votes"},
    5 => {controller: :exit, label: "Exit"}
  }.freeze

  def self.welcome_message
    <<-TEXT
      ** Welcome to the Employee Of The Month Votathon **
TEXT
  end

  def menu
    <<-MENU
      ** Please enter your choice **
      #{MENU_CHOICES.map{|k,v| "\t#{k}. #{v[:label]}"}.join("\n") }
    MENU
  end

  def run
    # print menu of choices
    # We put the menu as an instance method because we may want
    # to make dynamic menu options available depending on the user
    # so we need access to run time state.
    present menu
    present "choice> ", newline: false

    # get choice from the user and return the choice
    choice = get_input :choice

    # lookup the controller name from the constant
    controller = MENU_CHOICES.dig(choice.to_i, :controller)
    return controller
  end

end
