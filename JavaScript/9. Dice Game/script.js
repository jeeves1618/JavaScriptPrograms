'use strict';

//Selecting elements and not the actual score
//Below two lines using query Selector and get Element by ID work exactly the same
const score0Element = document.querySelector('#score--0');
const score1Element = document.getElementById('score--1');
const diceElement = document.querySelector('.dice');
const scoreNowPl1 = document.getElementById('current--0');
const scoreNowPl2 = document.getElementById('current--1');

const playerSection1 = document.querySelector('.player--0');
const playerSection2 = document.querySelector('.player--1');

//Creating the element for button actions
const btnNew = document.querySelector('.btn--new');
const btnRoll = document.querySelector('.btn--roll');
const btnHold = document.querySelector('.btn--hold');

let totalScores = [0, 0];
let scoreNow = 0;
let activePlayer = 0;

let playing = true;

score0Element.textContent = 0;
score1Element.textContent = 0;
diceElement.classList.add('hidden');

//Creating the event on 'ROLL DICE' button click
btnRoll.addEventListener('click', function () {
  if (playing) {
    const dice = Math.trunc(Math.random() * 6) + 1;
    console.log(dice);
    diceElement.classList.remove('hidden');
    diceElement.src = `dice-${dice}.png`;

    if (dice !== 1) {
      scoreNow = scoreNow + dice;
      document.getElementById(`current--${activePlayer}`).textContent =
        scoreNow;
    } else {
      scoreNow = 0;
      totalScores[activePlayer] = totalScores[activePlayer] + scoreNow;
      document.getElementById(`score--${activePlayer}`).textContent =
        totalScores[activePlayer];
      document.getElementById(`current--${activePlayer}`).textContent =
        scoreNow;
      activePlayer = activePlayer === 0 ? 1 : 0;
      playerSection1.classList.toggle('player--active');
      playerSection2.classList.toggle('player--active');
    }
  }
});

//Creating the event on 'STOP AND SAVE' button click

btnHold.addEventListener('click', function () {
  if (playing) {
    totalScores[activePlayer] = totalScores[activePlayer] + scoreNow;
    if (totalScores[activePlayer] >= 100) {
      document.getElementById(`score--${activePlayer}`).textContent =
        totalScores[activePlayer];
      document
        .querySelector(`.player--${activePlayer}`)
        .classList.add('player--winner');
      document
        .querySelector(`.player--${activePlayer}`)
        .classList.remove('player--active');
      playing = false;
    } else {
      document.getElementById(`score--${activePlayer}`).textContent =
        totalScores[activePlayer];
      scoreNow = 0;
      document.getElementById(`current--${activePlayer}`).textContent =
        scoreNow;
      activePlayer = activePlayer === 0 ? 1 : 0;
      playerSection1.classList.toggle('player--active');
      playerSection2.classList.toggle('player--active');
    }
  }
});

//Creating a new game
btnNew.addEventListener('click', function () {
  document.getElementById(`score--0`).textContent = 0;
  document.getElementById(`score--1`).textContent = 0;
  document.getElementById(`current--0`).textContent = 0;
  document.getElementById(`current--1`).textContent = 0;
  document.querySelector(`.player--0`).classList.add('player--active');
  document.querySelector(`.player--1`).classList.remove('player--active');
  document
    .querySelector(`.player--${activePlayer}`)
    .classList.remove('player--winner');
  totalScores = [0, 0];
  scoreNow = 0;
  activePlayer = 0;

  playing = true;
});
