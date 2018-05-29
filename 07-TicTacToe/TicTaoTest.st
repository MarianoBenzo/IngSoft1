!classDefinition: #TicTakToeTest category: #TicTaoTest!
TestCase subclass: #TicTakToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:45:35'!
test01WhenNobodyPlayedAllCountsAre0
	
	|game|
	
	game := TicTakToe new.
	
	self assert: (game playCountForX) = 0.
	self assert: (game playCountForO) = 0.! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:57:54'!
test02WhenXPlaysOnlyThatPositionIsFilled
	
	| game |
	
	game _ TicTakToe new.
		
	game  markWithXAt: 1 @ 2.
	
	self assert: (game playCountForX) = 1.
	self assert: (game position: 1 @ 2 isFilledWith: 'x').
	self deny: (game position: 1 @ 1 isFilledWith: 'x').
	self assert: (game playCountForO) = 0.! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:57:48'!
test03BothPlayersCanPlay

	| game |
	
	game _ TicTakToe new.
		
	game  markWithXAt: 1 @ 2.
	game  markWithOAt: 1 @ 1.
		
	self assert: (game playCountForX) = 1.
	self assert: (game playCountForO) = 1.
	self assert: (game position: 1 @ 2 isFilledWith: 'x').
	self assert: (game position: 1 @ 1 isFilledWith: 'o').! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:52:54'!
test04GameCannotStartWithO
	
	| game |
	
	game _ TicTakToe new.
	
	
	self 
	should: [game markWithOAt: 1 @ 2. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: (TicTakToe notTurnErrorMessageFor: 'o') equals: anError messageText .
		self assert: (game playCountForX) = 0.
		self assert: (game playCountForO) = 0.
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:54:23'!
test05PlayerXShouldRespectTurns
	
	| game |
	
	game _ TicTakToe new.
	
	game markWithXAt: 1 @ 1. 
	self 
	should: [game markWithXAt: 1 @ 2. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: (TicTakToe notTurnErrorMessageFor: 'x') equals: anError messageText .
		self assert: (game playCountForX) = 1.
		self assert: (game position: 1 @ 1 isFilledWith: 'x').
		self assert: (game playCountForO) = 0.
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:54:33'!
test06PlayerOShouldRespectTurns
	
	| game |
	
	game _ TicTakToe new.
	
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	
	 
	self 
	should: [game markWithOAt: 1 @ 2. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: (TicTakToe notTurnErrorMessageFor: 'o') equals: anError messageText .
		self assert: (game playCountForX) = 1.
		self assert: (game position: 1 @ 1 isFilledWith: 'x').
		self assert: (game playCountForO) = 1.
		self assert: (game position: 2 @ 1 isFilledWith: 'o').
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:10:09'!
test07PositionAlreadyUsed
	
	| game |
	
	game _ TicTakToe new.
	
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	
	 
	self 
	should: [game markWithXAt: 1 @ 1. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: TicTakToe positionTakenErrorMessage equals: anError messageText .
		self assert: (game playCountForX) = 1.
		self assert: (game position: 1 @ 1 isFilledWith: 'x').
		self assert: (game playCountForO) = 1.
		self assert: (game position: 2 @ 1 isFilledWith: 'o').
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:00:53'!
test08AddingInvalidPositionShouldRaiseError
	
	| game |
	
	game _ TicTakToe new.
		
	 
	self 
	should: [game markWithXAt: 4 @ 1. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: TicTakToe invalidPositionErrorMessage equals: anError messageText .
		self assert: (game playCountForX) = 0.
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:16:05'!
test09NobodyWins

	|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	
	self deny: game OHasWon.
	self deny: game XHasWon.
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:25:10'!
test10XWinsWhenFillingCol

	|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	game markWithXAt: 2@1.
	game markWithOAt: 3@3.
	game markWithXAt: 3@1.
	
	self deny: game OHasWon.
	self assert: game XHasWon.
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:26:50'!
test11XWinsWhenFillingRow

	|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 1@2.
	game markWithOAt: 3@3.
	game markWithXAt: 1@3.
	
	self deny: game OHasWon.
	self assert: game XHasWon.
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:27:19'!
test12XWinsWhenFillingDiagonal

	|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 1@3.
	game markWithXAt: 3@3.
	
	self deny: game OHasWon.
	self assert: game XHasWon.
	! !


!classDefinition: #Player category: #TicTaoTest!
Object subclass: #Player
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


!classDefinition: #PlayerO category: #TicTaoTest!
Player subclass: #PlayerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerO methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:45:32'!
markOAt: aPoint with: aGame

	aGame putOat: aPoint.! !

!PlayerO methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:47:09'!
markXAt: aPoint with: aGame

	self error: (TicTakToe notTurnErrorMessageFor: 'x')! !


!classDefinition: #PlayerX category: #TicTaoTest!
Player subclass: #PlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerX methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:47:32'!
markOAt: aPoint with: aGame

	self error: (TicTakToe notTurnErrorMessageFor: 'o')! !

!PlayerX methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:43:29'!
markXAt: aPoint with: aGame

	aGame putXat: aPoint.! !


!classDefinition: #TicTakToe category: #TicTaoTest!
Object subclass: #TicTakToe
	instanceVariableNames: 'dictionaryOfPoints currentPlayer playerX playerO'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:16:18'!
OHasWon

	^false! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:21:53'!
XHasWon

	^self hasWin: (self positionsFilledWith: 'x').! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:45:59'!
checkRulesBeforeAdding: aPoint
	
	 ((aPoint x between:1  and: 3) and: (aPoint y between:1  and: 3)) 
		ifFalse: [self error: TicTakToe invalidPositionErrorMessage]. 
	 
	self XHasWon ifTrue: [self error: TicTakToe cannotPlayAfterSomebodyWonErrorMessage].
	
	(dictionaryOfPoints keys includes: aPoint)
		ifTrue: [self error: TicTakToe positionTakenErrorMessage ].! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:25:34'!
hasCompletedCol: positions
	
	^(1 to: 3) anySatisfy: [: y | (positions count: [:position | position y = y]) = 3]	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:28:00'!
hasCompletedDiagonal: positions
	
	^((positions includes: 1@1) & (positions includes: 2@2) & (positions includes: 3@3)) |
					((positions includes: 3@1) & (positions includes: 2@2) & (positions includes: 1@3)) ! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:24:20'!
hasCompletedRow: positions

	^(1 to: 3) anySatisfy: [: x | (positions count: [:position | position x = x]) = 3].! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:28:32'!
hasWin: positions


	^(self hasCompletedRow: positions) | (self hasCompletedCol: positions)  | (self hasCompletedDiagonal: positions).! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:39:09'!
initialize

	dictionaryOfPoints := Dictionary new.
	playerX := PlayerX new.
	playerO := PlayerO new.
	currentPlayer := playerX.
	
	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:47:36'!
markWithOAt: aPoint
	
	self checkRulesBeforeAdding: aPoint.
		
	currentPlayer markOAt: aPoint with: self.
		
	currentPlayer := playerX.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:48:41'!
markWithXAt: aPoint
	
	self checkRulesBeforeAdding: aPoint.
		
	currentPlayer markXAt: aPoint with: self.
		
	currentPlayer := playerO.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:20:30'!
playCountFor: xOrO

   ^(self positionsFilledWith: xOrO) size! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:46:18'!
playCountForO

	^self playCountFor: 'o'! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 18:46:24'!
playCountForX

	^self playCountFor: 'x'! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:32:19'!
position: aPoint isFilledWith: xOrO

dictionaryOfPoints at: aPoint ifPresent: [:key | ^key = xOrO] ifAbsent: [^false ]


	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:19:55'!
positionsFilledWith: xOrO

   ^(dictionaryOfPoints keys select: [:key | (dictionaryOfPoints at: key) = xOrO ])! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:44:36'!
putOat: aPoint
		
	dictionaryOfPoints at: aPoint put: 'o'.
	
	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:44:22'!
putXat: aPoint
		
	dictionaryOfPoints at: aPoint put: 'x'.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTakToe class' category: #TicTaoTest!
TicTakToe class
	instanceVariableNames: ''!

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:46:15'!
cannotPlayAfterSomebodyWonErrorMessage

	^'no se puede jugar cuando alguien ya gano'.! !

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:59:03'!
invalidPositionErrorMessage

	^'posicion invalida'.! !

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:02:48'!
notTurnErrorMessageFor: xOrO

	^'no es el turno de ', xOrO! !

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:04:05'!
positionTakenErrorMessage

	^ 'Posicion ocupada'! !
