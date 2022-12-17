
[1mFrom:[0m /home/bart/repos/odin_project/Projects/hangman/lib/hangman.rb:68 Hangman#get_guess:

    [1;34m66[0m: [32mdef[0m [1;34mget_guess[0m
    [1;34m67[0m:   binding.pry
 => [1;34m68[0m:   guess = [31m[1;31m'[0m[31m[1;31m'[0m[31m[0m
    [1;34m69[0m:   loop [32mdo[0m
    [1;34m70[0m:     puts [31m[1;31m"[0m[31mEnter your guess[1;31m"[0m[31m[0m
    [1;34m71[0m:     guess = gets.chomp.upcase
    [1;34m72[0m:     [32mif[0m guess.match?([35m[1;35m/[0m[35m[A-Z][1;35m/[0m[35m[0m) && guess.length == [1;34m1[0m
    [1;34m73[0m:       [32mbreak[0m [32mif[0m this.check_for_valid_guess(guess)
    [1;34m74[0m:     [32melse[0m 
    [1;34m75[0m:       puts [31m[1;31m'[0m[31m[1;31m'[0m[31m[0m
    [1;34m76[0m:       game.display_guessed_letters
    [1;34m77[0m:       puts [31m[1;31m"[0m[31mInvalid entry, try again.[1;35m\n[0m[31m[1;31m"[0m[31m[0m
    [1;34m78[0m:     [32mend[0m
    [1;34m79[0m:   [32mend[0m 
    [1;34m80[0m:   guess
    [1;34m81[0m: [32mend[0m

