Class {
	#name : #CTIMDb,
	#superclass : #Object,
	#instVars : [
		'actors',
		'movies'
	],
	#category : #'Containers-IMDb'
}

{ #category : #customization }
CTIMDb class >> customMovie: movieSpec [

	^ [ :exit | 
	  self
		  movieW8: movieSpec exit: exit;
		  movieOurMostBeautifulLoveStories: movieSpec exit: exit;
		  movieDaysOfSummer: movieSpec exit: exit;
		  movieThePowlsIKnibe: movieSpec exit: exit;
		  movieSlapstick: movieSpec exit: exit;
		  movieIgualCaenDos: movieSpec exit: exit;
		  movieDidostatisMarjvena: movieSpec exit: exit;
		  movieDidostatisMarjvenaPirveli: movieSpec exit: exit;
		  movieTsigniPitsisa: movieSpec exit: exit;
		  movieDhobiGhat: movieSpec exit: exit;
		  movieInvisibleLove: movieSpec exit: exit;
		  movieOmaha: movieSpec exit: exit.

	  {  } ] valueWithArgumentedExit
]

{ #category : #'instance creation' }
CTIMDb class >> load: aFilename [

	| imdb actors movies anArray toAdjust |
	imdb := self new.

	actors := Dictionary new.
	movies := Dictionary new.

	toAdjust := Set new.

	aFilename asFileReference readStreamDo: [ :aStream | 
		[ aStream atEnd ] whileFalse: [ 
			| line |
			line := aStream nextLine.
			(Character tab split: line) bind: [ :actorName :movieSpec | 
				| tokens actor movie movieName movieYear movieArgs |
				tokens := movieSpec findTokens: { $(. $) }.

				movieName := tokens first.
				movieArgs := tokens copyFrom: 3 to: tokens size.

				tokens size > 1
					ifTrue: [ 
						movieYear := tokens second asInteger.

						movieYear ifNil: [ 
							| aSpec |
							aSpec := self customMovie: movieSpec.

							aSpec ifEmpty: [ toAdjust add: movieSpec ] ifNotEmpty: [ 
								movieName := aSpec first.
								movieYear := aSpec second.
								movieArgs := aSpec third ] ] ]
					ifFalse: [ movieYear := nil ].

				actor := actors at: actorName ifAbsentPut: [ 
					         CTIMDbActor new
						         name: actorName;
						         creationIndex: actors size + 1;
						         imdb: imdb;
						         yourself ].

				movie := movies at: movieName ifAbsentPut: [ 
					         CTIMDbMovie new
						         name: movieName;
						         year: movieYear;
						         args: movieArgs;
						         creationIndex: movies size + 1;
						         imdb: imdb;
						         yourself ].

				actor relations add: movie.
				movie relations add: actor ] ] ].

	anArray := Array new: actors size.
	actors do: [ :each | anArray at: each creationIndex put: each ].

	imdb actors: anArray.

	anArray := Array new: movies size.
	movies do: [ :each | anArray at: each creationIndex put: each ].

	imdb movies: anArray.

	^ { 
		  imdb.
		  toAdjust }
]

{ #category : #customization }
CTIMDb class >> movieDaysOfSummer: aString exit: aFullBlockClosure [

	aString = '(614) Days of Summer (2013)' ifTrue: [ 
		aFullBlockClosure value: { 
				'(614) Days of Summer '.
				2013.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieDhobiGhat: aString exit: aFullBlockClosure [

	aString = 'Dhobi Ghat (Mumbai Diaries) (2010)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Dhobi Ghat (Mumbai Diaries) '.
				2010.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieDidostatisMarjvena: aString exit: aFullBlockClosure [

	aString = 'Didostatis Marjvena (meore seria) (1970)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Didostatis Marjvena (meore seria) '.
				1970.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieDidostatisMarjvenaPirveli: aString exit: aFullBlockClosure [

	aString = 'Didostatis Marjvena (pirveli seria) (1969)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Didostatis Marjvena (pirveli seria) '.
				1969.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieIgualCaenDos: aString exit: aFullBlockClosure [

	aString = 'Igual caen dos (El atardecer del Pezu?as) (1997)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Igual caen dos (El atardecer del Pezu?as) '.
				1997.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieInvisibleLove: aString exit: aFullBlockClosure [

	aString = 'In(visible) Love (2013)' ifTrue: [ 
		aFullBlockClosure value: { 
				'In(visible) Love '.
				2013.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieOmaha: aString exit: aFullBlockClosure [

	aString = 'Omaha (The Movie) (1995)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Omaha (The Movie) '.
				1995.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieOurMostBeautifulLoveStories: aString exit: aFullBlockClosure [

	aString
	= 'Our Most Beautiful Love Stories (Are the Ones We Scripted) (2011)' 
		ifTrue: [ 
			aFullBlockClosure value: { 
					'Our Most Beautiful Love Stories (Are the Ones We Scripted) '.
					2011.
					{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieSlapstick: aString exit: aFullBlockClosure [

	aString = 'Slapstick (Of Another Kind) (1982)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Slapstick (Of Another Kind) '.
				1982.
				{  } } ]
]

{ #category : #customization }
CTIMDb class >> movieThePowlsIKnibe: aString exit: aFullBlockClosure [

	aString
	=
	'The Powls i (k)nibe - koncertgyseren ''Flaskernes nat'' (2003) (V)' 
		ifTrue: [ 
			aFullBlockClosure value: { 
					'The Powls i (k)nibe - koncertgyseren ''Flaskernes nat'' '.
					2003.
					{ 'V' } } ]
]

{ #category : #customization }
CTIMDb class >> movieTsigniPitsisa: aString exit: aFullBlockClosure [

	aString = 'Tsigni pitsisa (meore natsili) (1983) (TV)' ifTrue: [ 
		aFullBlockClosure value: { 
				'Tsigni pitsisa (meore natsili) '.
				1983.
				{ 'TV' } } ]
]

{ #category : #customization }
CTIMDb class >> movieW8: aString exit: aFullBlockClosure [

	aString = 'W8 (Weight) (2012)' ifTrue: [ 
		aFullBlockClosure value: { 
				'W8 (Weight) '.
				2012.
				{  } } ]
]

{ #category : #accessing }
CTIMDb >> actors [

	^ actors
]

{ #category : #accessing }
CTIMDb >> actors: anObject [

	actors := anObject
]

{ #category : #accessing }
CTIMDb >> movies [

	^ movies
]

{ #category : #accessing }
CTIMDb >> movies: anObject [

	movies := anObject
]
