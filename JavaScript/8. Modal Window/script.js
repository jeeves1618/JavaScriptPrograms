'use strict';

let clickAlls = document.querySelectorAll('.show-modal');

for (let i = 0; i < clickAlls.length; i++) {
  document
    .querySelectorAll('.show-modal')
    [i].addEventListener('click', function () {
      document.querySelector('.modal').classList.remove('hidden');
      document.querySelector('.overlay').classList.remove('hidden');
      console.log(`you have clicked the ${i + 1}th button`);
      switch (i) {
        case 0:
          console.log(`Musical Cloud`);
          document.querySelector('.titleModal').textContent = `Musical Cloud ☁`;
          document.querySelector(
            '.bodyModal'
          ).textContent = `The name of the record is Musical Cloud and it was released in the 1985. 
          The popular songs in Musical Cloud are Beauty is back..., Music turns away..., Got to say a good bye..., Magical blue... 
          and it was rated 4.5 in neighbourhoodsong.com`;
          break;
        case 1:
          console.log(`Bountiful Earth`);
          document.querySelector(
            '.titleModal'
          ).textContent = `Bountiful Earth 🌏`;
          document.querySelector(
            '.bodyModal'
          ).textContent = `The name of the record is Bountiful Earth and it was released in the 1995. 
          The popular songs in Bountiful Earth are Arc of my attraction ..., Nape of good hope..., Walk before me..., Make me vunerable... 
          and it was rated 4.8 in neighbourhoodsong.com`;
          break;
        case 2:
          console.log(`Song of the soul`);
          document.querySelector(
            '.titleModal'
          ).textContent = `Song of the soul 🎶`;
          document.querySelector(
            '.bodyModal'
          ).textContent = `The name of the record is Song of the soul and it was released in the 1982. 
          The popular songs in Song of the soul are Reading up in the light..., Warmth of the whites..., Sleep interrupted..., Angel from below..., Bemused with the becon..., Raga by the falls..., Cherishing the stream... 
          and it was rated 4.2 in neighbourhoodsong.com. It has been 40 years since its release. Even after 40 years, it is worth playing.`;
          break;
        case 3:
          console.log(`Wealth of the peace 🕊`);
          document.querySelector(
            '.titleModal'
          ).textContent = `Wealth of the peace`;
          document.querySelector(
            '.bodyModal'
          ).textContent = `The name of the record is Wealth of the peace and it was released in the 1980. 
          The popular songs in Wealth of the peace are The train shall go on..., Vibes across the ally..., Masking the mermaid..., Taken away in three... and it was rated 4.5 in neighbourhoodsong.com. It has been 42 years since its release. Even after 42 years, it is worth watching.`;
          break;
      }
    });
}
const closeModal = function () {
  document.querySelector('.modal').classList.add('hidden');
  document.querySelector('.overlay').classList.add('hidden');
};

//Closing the Modal Window on Clicking close button
document.querySelector('.close-modal').addEventListener('click', closeModal);

//Closing the Modal Window on Clicking outside the window. This will make the entire divsion <div class="overlay hidden"></div> clickable
document.querySelector('.overlay').addEventListener('click', closeModal);

document.addEventListener('keydown', function (event) {
  console.log(event);

  if (
    event.key === 'Escape' &&
    !document.querySelector('.modal', '.overlay').classList.contains('hidden')
  ) {
    closeModal();
  }
});
