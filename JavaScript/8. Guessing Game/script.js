'use strict';

let secretNumber = Math.floor(Math.random() * 21);
if (secretNumber === 0) secretNumber++;
console.log(secretNumber);
document.querySelector('.check').disabled = false;

let scoreNow = 20;
let maxScore = 20;
let highScore = 0;

document.querySelector('.check').addEventListener('click', function () {
  const guess = Number(document.querySelector('.guess').value);
  if (scoreNow === 1) document.querySelector('.check').disabled = true;
  console.log(guess, typeof guess);
  let displayMessage =
    guess > secretNumber ? '💥 You are too high!' : '💤 You are too low!';
  if (!guess) {
    document.querySelector('.message').textContent = '⛔ No number is entered!';
  } else if (guess === secretNumber) {
    document.querySelector('.message').textContent = '✔ You guessed it right!';
    //Changing the background color on Winning
    document.querySelector('body').style.backgroundColor = '#60b347';
    //Showing the number instead of ? on winning
    document.querySelector('.number').textContent = secretNumber;
    //Changing the font size on winning
    document.querySelector('.number').style.width = '30rem';
    console.log(`score now = ${scoreNow} and high score = ${highScore}`);
    if (scoreNow > highScore) {
      highScore = scoreNow;
      document.querySelector('.highscore').textContent = highScore;
    }
  } else if (guess >= secretNumber) {
    if (scoreNow === 1)
      document.querySelector('.message').textContent =
        '💥 Sorry you have lost the match!';
    else document.querySelector('.message').textContent = displayMessage;
    scoreNow--;
  } else {
    if (scoreNow === 1)
      document.querySelector('.message').textContent =
        '💥 Sorry you have lost the match!';
    else document.querySelector('.message').textContent = displayMessage;
    scoreNow--;
  }
  document.querySelector('.score').textContent = scoreNow;
});

document.querySelector('.again').addEventListener('click', function () {
  //Generating new secret number for the new game
  secretNumber = Math.floor(Math.random() * 21);
  if (secretNumber === 0) secretNumber++;
  console.log(secretNumber);
  //Resetting the background color for the new game
  document.querySelector('body').style.backgroundColor = '#222';
  //Resetting the size for the new game
  document.querySelector('.number').style.width = '15rem';
  //Resetting the score back to high score
  document.querySelector('.score').textContent = maxScore;
  //Resetting secret number
  document.querySelector('.number').textContent = '?';
  //Resetting the entered text
  document.querySelector('.guess').value = ``;
  //Resetting the text message
  document.querySelector('.message').textContent = '🤞 Start guessing...';
  //Reset the score back to 20
  scoreNow = 20;
});
