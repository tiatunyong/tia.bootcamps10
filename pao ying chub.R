#pao ying chub
#create function
#using while loop

rock_paper_scissors <- function() {
  options <- c("rock", "paper", "scissors")
  player_score <- 0
  computer_score <- 0
  
  while (TRUE) {
    player_choice <- tolower(readline("Enter your choice : "))
    
    if (!(player_choice %in% options)) {
      cat("Invalid choice. Please enter rock, paper, or scissors.\n")
      next
    }
    
    computer_choice <- sample(options,1)
    
    cat("Computer chose:", computer_choice, "\n")
    
    if (player_choice == computer_choice) {
      cat("It's a tie!\n")
    } else if (player_choice == "rock" && computer_choice == "scissors" ||
               player_choice == "paper" && computer_choice == "rock" ||
               player_choice == "scissors" && computer_choice == "paper") 
    {
      cat("You win!\n")
      player_score <- player_score + 1
    } else {
      cat("Computer wins!\n")
      computer_score <- computer_score + 1
    }
    
    cat("Score:\n")
    cat("Player:", player_score, "\n")
    cat("Computer:", computer_score, "\n")
    
    play_again <- tolower(readline("Do you want to play again? (yes/no): "))
    if (play_again != "yes") {
      break
    }
  }
}
