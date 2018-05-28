!classDefinition: #TicTakToeTest category: #TicTaoTest!
TestCase subclass: #TicTakToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 12:45:27'!
test01WhenNobodyPlayedAllCountsAre0
	
	|game|
	
	game := TicTakToe new.
	
	self assert: (game playCountFor: 'x') = 0.
	self assert: (game playCountFor: 'y') = 0.! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:33:27'!
test02AfterXPLayGameHasStarted
	
	| game |
	
	game _ TicTakToe new.
		
	game play: 'x' At: 1 @ 2.
	
	self assert: (game playCountFor: 'x') = 1.
	self assert: (game position: 1 @ 2 isFilledWith: 'x').
	self deny: (game position: 1 @ 1 isFilledWith: 'x').
	self assert: (game playCountFor: 'y') = 0.! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:18:23'!
test03GameCannotStartWithO
	
	| game |
	
	game _ TicTakToe new.
	
	
	self 
	should: [game play: 'o' At: 1 @ 2. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: (TicTakToe notTurnErrorMessageFor: 'o') equals: anError messageText .
		self assert: (game playCountFor: 'x') = 0.
		self assert: (game playCountFor: 'o') = 0.
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:33:49'!
test03PlayerXShouldRespectTurns
	
	| game |
	
	game _ TicTakToe new.
	
	game play: 'x' At: 1 @ 1. 
	self 
	should: [game play: 'x' At: 1 @ 2. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: (TicTakToe notTurnErrorMessageFor: 'x') equals: anError messageText .
		self assert: (game playCountFor: 'x') = 1.
		self assert: (game position: 1 @ 1 isFilledWith: 'x').
		self assert: (game playCountFor: 'y') = 0.
		] ! !


!classDefinition: #TicTakToe category: #TicTaoTest!
Object subclass: #TicTakToe
	instanceVariableNames: 'dictionaryOfPoints turn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:08:50'!
changeTurn

	turn = 'x' ifTrue: [turn := 'o'] ifFalse: [turn:= 'x'].
	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:00:27'!
initialize

	dictionaryOfPoints := Dictionary new.
	turn := 'x'.
	
	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:07:01'!
play: xOrO At: aPoint

	turn = xOrO ifTrue: [self changeTurn] ifFalse: [self error: (TicTakToe notTurnErrorMessageFor: xOrO)]. 

	dictionaryOfPoints at: aPoint put: xOrO.
	
	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 12:44:53'!
playCountFor: xOrO

   ^(dictionaryOfPoints keys select: [:key | (dictionaryOfPoints at: key) = xOrO ]) size! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:32:19'!
position: aPoint isFilledWith: xOrO

dictionaryOfPoints at: aPoint ifPresent: [:key | ^key = xOrO] ifAbsent: [^false ]


	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTakToe class' category: #TicTaoTest!
TicTakToe class
	instanceVariableNames: ''!

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:02:48'!
notTurnErrorMessageFor: xOrO

	^'no es el turno de ', xOrO! !
