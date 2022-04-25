# WordlES

[Wordles](http://wordles.online "Wordles") is the spanish version of the popular game [Wordle](http://nytimes.com/wordle "Wordle"). This version has been built with Flutter, then runs on Android, iOS and Web platforms. 

## Features
- Word of the day
- Create a Wordle game and share it with your friends
- Play a random Wordle
- Get the meaning of the words acording to the [RAE](http://rae.es/ "RAE")

## Gallery
| [![WordlES Home](https://ianpedraza.com/wordles/img/1.jpeg "WordlES Home")](https://ianpedraza.com/wordles/img/1.jpeg "WordlES Home") |  [![WordlES Board Light](https://ianpedraza.com/wordles/img/2.jpeg "WordlES Board Light")](https://ianpedraza.com/wordles/img/2.jpeg "WordlES Board Light") | [![WordlES Board Dark](https://ianpedraza.com/wordles/img/3.jpeg "WordlES Board Dark")](https://ianpedraza.com/wordles/img/3.jpeg "WordlES Board Dark")  |
| ------------ | ------------ | ------------ |
| [![WordlES Rules Light](https://ianpedraza.com/wordles/img/4.jpeg "WordlES Rules Light")](https://ianpedraza.com/wordles/img/4.jpeg "WordlES Rules Light") | [![WordlES Rules Dark](https://ianpedraza.com/wordles/img/5.jpeg "WordlES Rules Dark")](https://ianpedraza.com/wordles/img/5.jpeg "WordlES Rules Dark") |  [![WordlES Share](https://ianpedraza.com/wordles/img/6.jpeg "WordlES Share")](https://ianpedraza.com/wordles/img/6.jpeg "WordlES Share") |

## Setup
- Config your own Firebase project
- Firestore: creates collection wordles and add this object 
`
{
  id: "wordleOfTheDay",
  indexWord: 5558,
  name: "Wordles",
}
`
in `wordles/wordleOfTheDay`
- Config this [Firebase Cloud Functions (source)](https://gist.github.com/ianpedraza/0c416be93ef4104c240067a238a43ac4 "Cloud Functions").
- The project's cloud functions uses this node's [dependency](https://www.npmjs.com/package/rae-api "dependency"). Don't forget to add it.
- Config Firebase in project using [DefaultFirebaseOptions](https://firebase.flutter.dev/docs/cli/ "DefaultFirebaseOptions")

That's all ! Feedback and PR are welcome :)
