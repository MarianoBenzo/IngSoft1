!classDefinition: #BoardPositionTest category: #TicTaoTest!
TestCase subclass: #BoardPositionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 13:14:50'!
test01ABoardPositionInitializeInCorrectState

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	self assert: position isEmpty = true.
	self assert: position x = 1.
	self assert: position y = 2.! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 13:33:13'!
test02ABoardPositionReflectsStateWhenFilledBySymbolX

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	position markWithX.
	
	self assert: position markedWithX.
	self deny: position markedWithO.
	self deny: position isEmpty.! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 13:33:03'!
test03ABoardPositionReflectsStateWhenFilledBySymbolO

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	position markWithO.
	
	
	
	self assert: position markedWithO.
	self deny: position markedWithX.
	self deny: position isEmpty.! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:21:33'!
test04ABoardPositionCannotBeMarkedTwiceWithX

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	position markWithX.
	
	self 
	should: [position markWithX. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: TicTakToe positionTakenErrorMessage equals: anError messageText .	
		self assert: position markedWithX.
		self deny: position markedWithO.
		self deny: position isEmpty.
		].
	
	
	
! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:21:45'!
test05ABoardPositionCannotBeMarkedTwiceWithO

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	position markWithO.
	
	self 
	should: [position markWithO. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: TicTakToe positionTakenErrorMessage equals: anError messageText .	
		self assert: position markedWithO.
		self deny: position markedWithX.
		self deny: position isEmpty.
		].
	
	
	
! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:21:59'!
test06ABoardPositionCannotBeMarkedTwiceWithXAndThenWithO

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	position markWithX.
	
	self 
	should: [position markWithO. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: TicTakToe positionTakenErrorMessage equals: anError messageText .	
		self assert: position markedWithX.
		self deny: position markedWithO.
		self deny: position isEmpty.
		].
	
	
	
! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:22:08'!
test07ABoardPositionCannotBeMarkedTwiceWithOAndThenWithX

	|position|
	
	position := BoardPosition initializeWith: 1@2.
	
	position markWithO.
	
	self 
	should: [position markWithX. ]
	raise: Error - MessageNotUnderstood
	withExceptionDo: [: anError |
		
		self assert: TicTakToe positionTakenErrorMessage equals: anError messageText .	
		self assert: position markedWithO.
		self deny: position markedWithX.
		self deny: position isEmpty.
		].
	
	
	
! !


!classDefinition: #ObserversTest category: #TicTaoTest!
TestCase subclass: #ObserversTest
	instanceVariableNames: 'observer position1 position2 position3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!ObserversTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:05:32'!
setUp

	observer := PositionsObserver new.
	
	position1 := BoardPosition initializeWith: 1@1.
	position2 := BoardPosition initializeWith: 1@2.
	position3 := BoardPosition initializeWith: 1@3.
	
	position1 registerObserver: observer.
	position2 registerObserver: observer.
	position3 registerObserver: observer.! !

!ObserversTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:04:35'!
test01ObserverStartsInNonCompletedState

	self deny: observer completedByXs.
	self deny: observer completedByOs.! !

!ObserversTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:12:29'!
test02WhenMarkingOnly1PositionIsNotCompletedByOorXs

	position1 markWithX.

	self deny: observer completedByXs.
	self deny: observer completedByOs.! !

!ObserversTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:12:55'!
test03WhenMarking2PositionIsNotCompletedByOorXs

	position1 markWithX.
	position2 markWithX.

	self deny: observer completedByXs.
	self deny: observer completedByOs.! !

!ObserversTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:13:56'!
test04WhenMarking3PositionIsCompletedByXs

	position1 markWithX.
	position2 markWithX.
	position3 markWithX.

	self assert: observer completedByXs.
	self deny: observer completedByOs.! !


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

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:00:23'!
test02WhenXPlaysOnlyThatPositionIsFilled
	
	| game |
	
	game _ TicTakToe new.
		
	game  markWithXAt: 1 @ 2.
	
	self assert: (game playCountForX) = 1.
	self assert: (game isPositionMarkedWithX: 1 @ 2).
	self deny: (game isPositionMarkedWithX: 1 @ 1).
	self assert: (game playCountForO) = 0.! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:59:43'!
test03BothPlayersCanPlay

	| game |
	
	game _ TicTakToe new.
		
	game  markWithXAt: 1 @ 2.
	game  markWithOAt: 1 @ 1.
		
	self assert: (game playCountForX) = 1.
	self assert: (game playCountForO) = 1.
	self assert: (game isPositionMarkedWithX: 1 @ 2).
	self assert: (game isPositionMarkedWithO: 1 @ 1).! !

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

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:03:01'!
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
		self assert: (game isPositionMarkedWithX: 1 @ 1).
		self assert: (game playCountForO) = 0.
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:03:26'!
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
		self assert: (game isPositionMarkedWithX: 1 @ 1).
		self assert: (game playCountForO) = 1.
		self assert: (game isPositionMarkedWithO: 2 @ 1).
		] ! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:04:02'!
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
		self assert: (game isPositionMarkedWithX: 1 @ 1).
		self assert: (game playCountForO) = 1.
		self assert: (game isPositionMarkedWithO: 2 @ 1).
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

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:30:07'!
test09NobodyWins

	"|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	
	self deny: game OHasWon.
	self deny: game XHasWon."
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:30:13'!
test10XWinsWhenFillingCol

	"|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@2.
	game markWithXAt: 2@1.
	game markWithOAt: 3@3.
	game markWithXAt: 3@1.
	
	self deny: game OHasWon.
	self assert: game XHasWon.
	"! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:30:22'!
test11XWinsWhenFillingRow

	"|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 1@2.
	game markWithOAt: 3@3.
	game markWithXAt: 1@3.
	
	self deny: game OHasWon.
	self assert: game XHasWon.
	"! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:30:29'!
test12XWinsWhenFillingDiagonal

	"|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 1@3.
	game markWithXAt: 3@3.
	
	self deny: game OHasWon.
	self assert: game XHasWon.
	"! !


!classDefinition: #BoardPosition category: #TicTaoTest!
Object subclass: #BoardPosition
	instanceVariableNames: 'state point observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!BoardPosition methodsFor: 'evaluating' stamp: 'PF 5/29/2018 14:04:20'!
isEmpty

	^state isEmpty.! !

!BoardPosition methodsFor: 'evaluating' stamp: 'PF 5/29/2018 14:05:56'!
markedWithO

	^state markedWithO! !

!BoardPosition methodsFor: 'evaluating' stamp: 'PF 5/29/2018 14:06:03'!
markedWithX

	^state markedWithX! !

!BoardPosition methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:19:04'!
x
	^point x.! !

!BoardPosition methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:19:08'!
y
	^point y.! !


!BoardPosition methodsFor: 'initialize' stamp: 'PF 5/29/2018 15:50:41'!
initializeWith: aPoint

	point := aPoint.
	state := BoardPositionEmptyState initializeWith: self.
	observers := OrderedCollection new.! !


!BoardPosition methodsFor: 'mark' stamp: 'PF 5/29/2018 16:06:55'!
markWithO

	state throwErrorWhenPositionIsMarked.
	state := BoardPositionOState initializeWith: self.
	observers do: [:observer | observer updateForO].
	! !

!BoardPosition methodsFor: 'mark' stamp: 'PF 5/29/2018 16:09:55'!
markWithX

	state throwErrorWhenPositionIsMarked.
	state := BoardPositionXState initializeWith: self.
	observers do: [:observer | observer updateForX].! !


!BoardPosition methodsFor: 'observers' stamp: 'PF 5/29/2018 15:50:00'!
registerObserver: anObserver

	observers add: anObserver.

! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardPosition class' category: #TicTaoTest!
BoardPosition class
	instanceVariableNames: ''!

!BoardPosition class methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 13:17:56'!
initializeWith: aPoint

  ^self new initializeWith: aPoint! !


!classDefinition: #BoardPositionState category: #TicTaoTest!
Object subclass: #BoardPositionState
	instanceVariableNames: 'position'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!BoardPositionState methodsFor: 'initialize' stamp: 'PF 5/29/2018 14:14:47'!
initializeWith: aPosition

	position := aPosition.! !


!BoardPositionState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:46:41'!
isEmpty

	^self subclassResponsibility.! !

!BoardPositionState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:47:01'!
markedWithO

	^self subclassResponsibility.! !

!BoardPositionState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:46:58'!
markedWithX

	^self subclassResponsibility.! !


!BoardPositionState methodsFor: 'error' stamp: 'PF 5/29/2018 15:29:42'!
throwErrorWhenPositionIsMarked

	^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardPositionState class' category: #TicTaoTest!
BoardPositionState class
	instanceVariableNames: ''!

!BoardPositionState class methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 13:44:01'!
initializeWith: aPosition

	^self new initializeWith: aPosition.! !


!classDefinition: #BoardPositionEmptyState category: #TicTaoTest!
BoardPositionState subclass: #BoardPositionEmptyState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!BoardPositionEmptyState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:54:23'!
isEmpty

	^true! !

!BoardPositionEmptyState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:54:49'!
markedWithO

	^false! !

!BoardPositionEmptyState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:54:45'!
markedWithX

	^false! !


!BoardPositionEmptyState methodsFor: 'error' stamp: 'PF 5/29/2018 15:26:48'!
throwErrorWhenPositionIsMarked! !


!classDefinition: #BoardPositionOState category: #TicTaoTest!
BoardPositionState subclass: #BoardPositionOState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!BoardPositionOState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:55:26'!
isEmpty

	^false.! !

!BoardPositionOState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:56:34'!
markedWithO

	^true.! !

!BoardPositionOState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:56:41'!
markedWithX

	^false.! !


!BoardPositionOState methodsFor: 'error' stamp: 'PF 5/29/2018 15:26:39'!
throwErrorWhenPositionIsMarked

	self error: TicTakToe positionTakenErrorMessage.! !


!classDefinition: #BoardPositionXState category: #TicTaoTest!
BoardPositionState subclass: #BoardPositionXState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!BoardPositionXState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 13:58:06'!
isEmpty

	^false! !

!BoardPositionXState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 14:00:12'!
markedWithO

	^false.! !

!BoardPositionXState methodsFor: 'evaluating' stamp: 'PF 5/29/2018 14:00:03'!
markedWithX

	^true.! !


!BoardPositionXState methodsFor: 'error' stamp: 'PF 5/29/2018 15:26:23'!
throwErrorWhenPositionIsMarked

	self error: TicTakToe positionTakenErrorMessage.! !


!classDefinition: #ObserverState category: #TicTaoTest!
Object subclass: #ObserverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


!classDefinition: #NoXNoO category: #TicTaoTest!
ObserverState subclass: #NoXNoO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


!classDefinition: #OnlyO category: #TicTaoTest!
ObserverState subclass: #OnlyO
	instanceVariableNames: 'count'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


!classDefinition: #OnlyX category: #TicTaoTest!
ObserverState subclass: #OnlyX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


!classDefinition: #XsAndOs category: #TicTaoTest!
ObserverState subclass: #XsAndOs
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


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

!PlayerO methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:51:09'!
markOAt: aPosition

	aPosition markWithO.! !

!PlayerO methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:51:20'!
markXAt: aPosition

	self error: (TicTakToe notTurnErrorMessageFor: 'x')! !


!classDefinition: #PlayerX category: #TicTaoTest!
Player subclass: #PlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerX methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:50:52'!
markOAt: aPosition

	self error: (TicTakToe notTurnErrorMessageFor: 'o')! !

!PlayerX methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:50:42'!
markXAt: aPosition

	aPosition markWithX.! !


!classDefinition: #PositionsObserver category: #TicTaoTest!
Object subclass: #PositionsObserver
	instanceVariableNames: 'state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PositionsObserver methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:58:33'!
completedByOs

	^false.! !

!PositionsObserver methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:58:30'!
completedByXs

	^false.! !

!PositionsObserver methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:19:59'!
initialize

	state := NoXNoO new.
	! !

!PositionsObserver methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:44:17'!
updateForO

"TODO: cambiar al estado correspondiente"


"TODO: cambiar al estado correspondiente"


"estados posibles: NoXNoO, OnlyX, OnlyO, XsAndOs"

"OnlyX y OnlyO tienen un count que puede ir del 1 al 3"

	! !

!PositionsObserver methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:44:13'!
updateForX

"TODO: cambiar al estado correspondiente"


"estados posibles: NoXNoO, OnlyX, OnlyO, XsAndOs"

"OnlyX y OnlyO tienen un count que puede ir del 1 al 3"
! !


!classDefinition: #TicTakToe category: #TicTaoTest!
Object subclass: #TicTakToe
	instanceVariableNames: 'currentPlayer playerX playerO positions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:16:18'!
OHasWon

	^false! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 20:21:53'!
XHasWon

	^self hasWin: (self positionsFilledWith: 'x').! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 16:46:14'!
initialize

	positions := OrderedCollection new.
	playerX := PlayerX new.
	playerO := PlayerO new.
	currentPlayer := playerX.
	
	#(1 2 3 ) do: [:x | #(1 2 3) do: [:y | positions add: (BoardPosition initializeWith: x@y).]]
	
	
	"TODO: registrar los observers en las posiciones. son 8 observers, uno por cada fila, columna o diagonal"
	
	! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:01:10'!
isPositionMarkedWithO: aPoint

	^(self positionFor: aPoint) markedWithO.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:01:02'!
isPositionMarkedWithX: aPoint

	^(self positionFor: aPoint) markedWithX.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:15:31'!
markWithOAt: aPoint
	
	currentPlayer markOAt: (self positionFor: aPoint).
		
	currentPlayer := playerX.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 15:15:35'!
markWithXAt: aPoint
			
	currentPlayer markXAt: (self positionFor: aPoint).
		
	currentPlayer := playerO.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:47:11'!
playCountForO

	^(positions select: [:position | position markedWithO]) size.! !

!TicTakToe methodsFor: 'as yet unclassified' stamp: 'PF 5/29/2018 14:47:22'!
playCountForX

	^(positions select: [:position | position markedWithX]) size.! !


!TicTakToe methodsFor: 'private' stamp: 'PF 5/29/2018 15:13:21'!
positionFor: aPoint


	[^(positions select: [:position | (position x = aPoint x) and: (position y = aPoint y)]) first.]
	
	on: Error do:[self error: TicTakToe invalidPositionErrorMessage].

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
