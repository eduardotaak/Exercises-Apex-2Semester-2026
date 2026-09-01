public Integer rockPaperScissors(String player1, String player2) {

    if (player2 == player1){
        return 0;
    }

    if((player1 == 'rock' && player2 == 'scissors') ||
        (player1 == 'scissors' && player2 == 'paper') ||
        (player1 == 'paper' && player2 == 'rock')){
            return 1;
    }
    return 2;
}