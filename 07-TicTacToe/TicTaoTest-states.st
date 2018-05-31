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

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:46:37'!
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

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:23:28'!
test09TheGameIsNotOver

	|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	self deny: game isOver.
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:24:19'!
test10NobodyWins

	|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:19:38'!
ztest09NobodyWins

	"|game|
	
	game := TicTakToe new.
	
	game markWithXAt: 1@1.
	game markWithOAt: 2@1.
	game markWithXAt: 2@2.
	game markWithOAt: 3@3.
	
	
	self deny: game OHasWon.
	self deny: game XHasWon."
	! !

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:19:42'!
ztest10XWinsWhenFillingCol

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

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:19:47'!
ztest11XWinsWhenFillingRow

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

!TicTakToeTest methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:19:51'!
ztest12XWinsWhenFillingDiagonal

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
	instanceVariableNames: 'state position'
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

!BoardPosition methodsFor: 'evaluating' stamp: 'MB 5/30/2018 19:59:57'!
x
	^ position x.! !

!BoardPosition methodsFor: 'evaluating' stamp: 'MB 5/30/2018 20:00:06'!
y
	^ position y.! !


!BoardPosition methodsFor: 'initialize' stamp: 'MB 5/30/2018 19:58:08'!
initializeWith: aPosition

	position := aPosition.
	state := BoardPositionEmptyState new.! !


!BoardPosition methodsFor: 'mark' stamp: 'MB 5/30/2018 20:46:04'!
markWithO

	state throwErrorWhenPositionIsMarked.
	state := BoardPositionOState new.
	! !

!BoardPosition methodsFor: 'mark' stamp: 'MB 5/30/2018 20:46:09'!
markWithX

	state throwErrorWhenPositionIsMarked.
	state := BoardPositionXState new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'BoardPosition class' category: #TicTaoTest!
BoardPosition class
	instanceVariableNames: ''!

!BoardPosition class methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:56:28'!
initializeWith: aPosition

	^ self new initializeWith: aPosition.! !


!classDefinition: #BoardPositionState category: #TicTaoTest!
Object subclass: #BoardPositionState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!


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


!classDefinition: #GameState category: #TicTaoTest!
Object subclass: #GameState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:05:52'!
hasPlayerOWon

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:46:35'!
hasPlayerXWon

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:46:44'!
isOver

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:46:48'!
isPlayingO

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:46:51'!
isPlayingX

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:46:54'!
isTied

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:06:00'!
markWithOAt: aPosition

	^self subclassResponsibility.! !

!GameState methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 19:46:59'!
markWithXAt: aPosition

	^self subclassResponsibility.! !


!classDefinition: #PlayerOTurn category: #TicTaoTest!
GameState subclass: #PlayerOTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:06:53'!
hasPlayerOWon

	^false.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:06:59'!
hasPlayerXWon

	^false.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:07:06'!
isOver

	^false.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:07:13'!
isPlayingO

	^true.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:07:20'!
isPlayingX

	^false.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:07:28'!
isTied

	^false.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:58:04'!
markWithOAt: aPosition

	aPosition markWithO.! !

!PlayerOTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:58:09'!
markWithXAt: aPosition

	self error: (TicTakToe notTurnErrorMessageFor: 'x')! !


!classDefinition: #PlayerXTurn category: #TicTaoTest!
GameState subclass: #PlayerXTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:00'!
hasPlayerOWon

	^false.! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:06'!
hasPlayerXWon

	^false.! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:11'!
isOver

	^false.! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:25'!
isPlayingO

	^false.! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:31'!
isPlayingX

	^true.! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:38'!
isTied

	^false.! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:57:33'!
markWithOAt: aPosition

	self error: (TicTakToe notTurnErrorMessageFor: 'o')! !

!PlayerXTurn methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 20:57:26'!
markWithXAt: aPosition

	aPosition markWithX.! !


!classDefinition: #TiedGame category: #TicTaoTest!
GameState subclass: #TiedGame
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:48'!
hasPlayerOWon

	^false.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:52'!
hasPlayerXWon

	^false.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:09:59'!
isOver

	^true.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:10:04'!
isPlayingO

	^false.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:10:08'!
isPlayingX

	^false.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:10:17'!
isTied

	^true.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:17:12'!
markWithOAt: aPosition

	^self error: TicTakToe cannotPlayAfterGameOveredErrorMessage.! !

!TiedGame methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:17:19'!
markWithXAt: aPosition

	^self error: TicTakToe cannotPlayAfterGameOveredErrorMessage.! !


!classDefinition: #WinPlayerO category: #TicTaoTest!
GameState subclass: #WinPlayerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:01'!
hasPlayerOWon

	^true.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:11'!
hasPlayerXWon

	^false.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:18'!
isOver

	^true.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:22'!
isPlayingO

	^false.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:25'!
isPlayingX

	^false.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:29'!
isTied

	^false.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:17:24'!
markWithOAt: aPosition

	^self error: TicTakToe cannotPlayAfterGameOveredErrorMessage.! !

!WinPlayerO methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:17:28'!
markWithXAt: aPosition

	^self error: TicTakToe cannotPlayAfterGameOveredErrorMessage.! !


!classDefinition: #WinPlayerX category: #TicTaoTest!
GameState subclass: #WinPlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:39'!
hasPlayerOWon

	^false.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:47'!
hasPlayerXWon

	^true.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:53'!
isOver

	^true.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:13:56'!
isPlayingO

	^false.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:14:00'!
isPlayingX

	^false.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:14:03'!
isTied

	^false.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:17:32'!
markWithOAt: aPosition

	^self error: TicTakToe cannotPlayAfterGameOveredErrorMessage.! !

!WinPlayerX methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:17:36'!
markWithXAt: aPosition

	^self error: TicTakToe cannotPlayAfterGameOveredErrorMessage.! !


!classDefinition: #TicTakToe category: #TicTaoTest!
Object subclass: #TicTakToe
	instanceVariableNames: 'gameState board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTakToe methodsFor: 'mark' stamp: 'MB 5/30/2018 20:06:24'!
markWithOAt: aPoint
	
	gameState markWithOAt: (self boardPositionFor: aPoint).
		
	gameState := PlayerXTurn new.! !

!TicTakToe methodsFor: 'mark' stamp: 'MB 5/30/2018 20:06:35'!
markWithXAt: aPoint
			
	gameState markWithXAt: (self boardPositionFor: aPoint).
		
	gameState := PlayerOTurn new.! !


!TicTakToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:12:19'!
hasPlayerOWon
	^ gameState hasPlayerOWon.! !

!TicTakToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:12:13'!
hasPlayerXWon
	^ gameState hasPlayerXWon.! !

!TicTakToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:46'!
isOver
	^ gameState isOver.! !

!TicTakToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:34'!
isPlayingO
	^ gameState isPlayingO.! !

!TicTakToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:28'!
isPlayingX
	^ gameState isPlayingX.! !

!TicTakToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:57'!
isTied
	^ gameState isTied.! !


!TicTakToe methodsFor: 'private' stamp: 'MB 5/30/2018 19:28:51'!
boardPositionFor: aPoint


	[^(board select: [:position | (position x = aPoint x) and: (position y = aPoint y)]) first.]
	
	on: Error do:[self error: TicTakToe invalidPositionErrorMessage].

 		! !


!TicTakToe methodsFor: 'initialize' stamp: 'MB 5/30/2018 19:52:35'!
initialize

	board := OrderedCollection new.
	gameState := PlayerXTurn new.
	
	#(1 2 3 ) do: [:x | #(1 2 3) do: [:y | board add: (BoardPosition initializeWith: x@y).]]
	
	
	"TODO: registrar los observers en las posiciones. son 8 observers, uno por cada fila, columna o diagonal"
	
	! !


!TicTakToe methodsFor: 'test' stamp: 'MB 5/30/2018 20:08:44'!
isPositionMarkedWithO: aPoint

	^(self boardPositionFor: aPoint) markedWithO.! !

!TicTakToe methodsFor: 'test' stamp: 'MB 5/30/2018 19:32:28'!
isPositionMarkedWithX: aPoint

	^(self boardPositionFor: aPoint) markedWithX.! !

!TicTakToe methodsFor: 'test' stamp: 'MB 5/30/2018 20:52:42'!
playCountForO

	^ (board select: [ :position | position markedWithO ]) size.! !

!TicTakToe methodsFor: 'test' stamp: 'MB 5/30/2018 20:52:48'!
playCountForX

	^ (board select: [ :position | position markedWithX ]) size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTakToe class' category: #TicTaoTest!
TicTakToe class
	instanceVariableNames: ''!

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:16:28'!
cannotPlayAfterGameOveredErrorMessage

	^'no se puede jugar cuando el juego termino'.! !

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:59:03'!
invalidPositionErrorMessage

	^'posicion invalida'.! !

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:02:48'!
notTurnErrorMessageFor: xOrO

	^'no es el turno de ', xOrO! !

!TicTakToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:04:05'!
positionTakenErrorMessage

	^ 'Posicion ocupada'! !
