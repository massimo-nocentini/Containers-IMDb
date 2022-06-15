Class {
	#name : #CTIMDbMovie,
	#superclass : #CTIMDbEntity,
	#instVars : [
		'year',
		'args'
	],
	#category : #'Containers-IMDb'
}

{ #category : #accessing }
CTIMDbMovie >> args [

	^ args
]

{ #category : #accessing }
CTIMDbMovie >> args: anObject [

	args := anObject
]

{ #category : #accessing }
CTIMDbMovie >> year [

	^ year
]

{ #category : #accessing }
CTIMDbMovie >> year: anObject [

	year := anObject
]
