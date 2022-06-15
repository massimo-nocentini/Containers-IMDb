Class {
	#name : #CTIMDbEntity,
	#superclass : #Object,
	#instVars : [
		'name',
		'relations',
		'creationIndex',
		'imdb'
	],
	#category : #'Containers-IMDb'
}

{ #category : #accessing }
CTIMDbEntity >> creationIndex [

	^ creationIndex
]

{ #category : #accessing }
CTIMDbEntity >> creationIndex: anObject [

	creationIndex := anObject
]

{ #category : #accessing }
CTIMDbEntity >> imdb [

	^ imdb
]

{ #category : #accessing }
CTIMDbEntity >> imdb: anObject [

	imdb := anObject
]

{ #category : #initialization }
CTIMDbEntity >> initialize [

	super initialize.

	relations := IdentitySet new
]

{ #category : #accessing }
CTIMDbEntity >> name [

	^ name
]

{ #category : #accessing }
CTIMDbEntity >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CTIMDbEntity >> relations [

	^ relations
]

{ #category : #accessing }
CTIMDbEntity >> relations: anObject [

	relations := anObject
]
