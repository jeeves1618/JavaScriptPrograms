'use strict';
//An Array explaining a musical record
let beatenUpRecord = [
  `Musical Cloud`,
  1985,
  [
    `Beauty is back...`,
    `Music turns away...`,
    `Got to say a good bye...`,
    `Magical blue...`,
  ],
  4.5,
];

//Declaring an Array to show that arrays and objects can be stored in the same array
let arrayOfRecords = [];
arrayOfRecords.push(beatenUpRecord);

//Accessing the Array
let aboutRecord = `Array: The name of the record is ${beatenUpRecord[0]} and it was released in the ${beatenUpRecord[1]}. 
The popular songs in ${beatenUpRecord[0]} are ${beatenUpRecord[2]} and it was rated ${beatenUpRecord[3]} in neighbourhoodsong.com`;

document.getElementById('remark').innerHTML = aboutRecord;

//An Object Explaining the same musical record
let beatenUpRecordObject = {
  title: `Bountiful Earth`,
  yearOfRelease: 1995,
  popularSongs: [
    `Arc of my attraction ...`,
    `Nape of good hope...`,
    `Walk before me...`,
    `Make me vunerable...`,
  ],
  rating: 4.8,
};

//Leveraging Bracket Notation
let typeOfYear = `Release`;
//Accessing the Object
let aboutAnotherRecord = `Object: The name of the record is ${
  beatenUpRecordObject[`title`]
} and it was released in the ${beatenUpRecordObject[`yearOf` + typeOfYear]}. 
The popular songs in ${beatenUpRecordObject.title} are ${
  beatenUpRecordObject[`popularSongs`]
} and it was rated ${beatenUpRecordObject.rating} in neighbourhoodsong.com`;

document.getElementById('remarkAnother').innerHTML = aboutAnotherRecord;

arrayOfRecords.push(beatenUpRecordObject);

//Now lets add a function to the object
let funcRecord = {
  title: `Song of the soul`,
  yearOfRelease: 1982,
  popularSongs: [
    `Reading up in the light...`,
    `Warmth of the whites...`,
    `Sleep interrupted...`,
    `Angel from below...`,
    `Bemused with the becon...`,
    `Raga by the falls...`,
    `Cherishing the stream...`,
  ],
  rating: 4.2,

  age: function (yearOfRelease) {
    return 2022 - yearOfRelease;
  },
};

//Accessing the Object
let aboutFuncRecord = `Function: The name of the record is ${
  funcRecord[`title`]
} and it was released in the ${funcRecord[`yearOf` + typeOfYear]}. 
The popular songs in ${funcRecord.title} are ${
  funcRecord[`popularSongs`]
} and it was rated ${funcRecord.rating} in neighbourhoodsong.com. 
It has been ${funcRecord[`age`](
  1982
)} years since its release. Even after ${funcRecord.age(
  1982
)} years, it is worth playing.`;

document.getElementById('functioningRemark').innerHTML = aboutFuncRecord;

arrayOfRecords.push(funcRecord);
//Now lets use this operator to remove the hardcoding.

let thisRecord = {
  title: `Wealth of the peace`,
  yearOfRelease: 1980,
  popularSongs: [
    `The train shall go on...`,
    `Vibes across the ally...`,
    `Masking the mystery...`,
    `Taken away in three...`,
  ],
  rating: 4.5,

  age: function () {
    return 2022 - this.yearOfRelease;
  },
};

//Accessing the Object
let aboutThisRecord = `This: The name of the record is ${
  thisRecord[`title`]
} and it was released in the ${thisRecord[`yearOf` + typeOfYear]}. 
The popular songs in ${thisRecord.title} are ${
  thisRecord[`popularSongs`]
} and it was rated ${thisRecord.rating} in neighbourhoodsong.com. 
It has been ${thisRecord[
  `age`
]()} years since its release. Even after ${thisRecord.age()} years, it is worth watching.`;

document.getElementById('thisRemark').innerHTML = aboutThisRecord;

arrayOfRecords.push(thisRecord);

let songList = ``;

//lets use this Array to see how we can build one
let listOfSongs = [];

for (let i = 0; i < arrayOfRecords.length; i++) {
  if (arrayOfRecords[i].hasOwnProperty('popularSongs')) {
    for (
      let songs = 0;
      songs < arrayOfRecords[i].popularSongs.length;
      songs++
    ) {
      songList =
        songList +
        `
            <li> ${arrayOfRecords[i].popularSongs[songs]} </li>`;
      listOfSongs.push(arrayOfRecords[i].popularSongs[songs]);
    }
  } else {
    for (let songs = 0; songs < arrayOfRecords[i][2].length; songs++) {
      songList =
        songList +
        `
            <li> ${arrayOfRecords[i][2][songs]} </li>`;
      listOfSongs.push(arrayOfRecords[i][2][songs]);
    }
  }
}
let summationPhrase = `Here are the list of songs for `;
let yourName = `you`;
document.querySelector('.yourName').textContent = summationPhrase + yourName;
let dummy = `no`;
document.querySelector('.choice').addEventListener('click', function () {
  document.querySelector('#remark').textContent = aboutFuncRecord;
  if (document.querySelector('.yourChoice').value == ``) {
    yourName = 'you';
    console.log(`one`);
  } else {
    yourName = document.querySelector('.yourChoice').value;
    console.log(`two`);
  }
  console.log(document.querySelector('.yourChoice').value);
  document.querySelector('.yourName').textContent = summationPhrase + yourName;
});

songList = '<ul>' + songList + '</ul>';

document.getElementById('songList').innerHTML = songList;

console.log(dummy);
if (
  dummy === `Y` ||
  dummy === `YES` ||
  dummy === `YEAH` ||
  dummy === `OFCOURSE` ||
  dummy === `OF COURSE`
) {
  console.log('Changing....');
  document.querySelector('#remark').textContent = aboutFuncRecord;
}
