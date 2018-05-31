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

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test04ABoardPositionCannotBeMarkedTwiceWithX
	| position |
	position _ BoardPosition initializeWith: 1 @ 2.
	position markWithX.
	self
		should: [ position markWithX ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTaeToe positionTakenErrorMessage
				equals: anError messageText.
			self assert: position markedWithX.
			self deny: position markedWithO.
			self deny: position isEmpty ].! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test05ABoardPositionCannotBeMarkedTwiceWithO
	| position |
	position _ BoardPosition initializeWith: 1 @ 2.
	position markWithO.
	self
		should: [ position markWithO ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTaeToe positionTakenErrorMessage
				equals: anError messageText.
			self assert: position markedWithO.
			self deny: position markedWithX.
			self deny: position isEmpty ].! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test06ABoardPositionCannotBeMarkedWithXAndThenWithO
	| position |
	position _ BoardPosition initializeWith: 1 @ 2.
	position markWithX.
	self
		should: [ position markWithO ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTaeToe positionTakenErrorMessage
				equals: anError messageText.
			self assert: position markedWithX.
			self deny: position markedWithO.
			self deny: position isEmpty ].! !

!BoardPositionTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test07ABoardPositionCannotBeMarkedWithOAndThenWithX
	| position |
	position _ BoardPosition initializeWith: 1 @ 2.
	position markWithO.
	self
		should: [ position markWithX ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTaeToe positionTakenErrorMessage
				equals: anError messageText.
			self assert: position markedWithO.
			self deny: position markedWithX.
			self deny: position isEmpty ].! !


!classDefinition: #TicTaeToeTest category: #TicTaoTest!
TestCase subclass: #TicTaeToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test01WhenNobodyPlayedAllCountsAre0
	| game |
	game _ TicTaeToe new.
	self assert: game playCountForX = 0.
	self assert: game playCountForO = 0.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test02WhenXPlaysOnlyThatPositionIsFilled
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 2.
	self assert: game playCountForX = 1.
	self assert: (game isPositionMarkedWithX: 1 @ 2).
	self deny: (game isPositionMarkedWithX: 1 @ 1).
	self assert: game playCountForO = 0.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test03BothPlayersCanPlay
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 1 @ 1.
	self assert: game playCountForX = 1.
	self assert: game playCountForO = 1.
	self assert: (game isPositionMarkedWithX: 1 @ 2).
	self assert: (game isPositionMarkedWithO: 1 @ 1).! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test04GameCannotStartWithO
	| game |
	game _ TicTaeToe new.
	self
		should: [ game markWithOAt: 1 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: (TicTaeToe notTurnErrorMessageFor: 'o')
				equals: anError messageText.
			self assert: game playCountForX = 0.
			self assert: game playCountForO = 0 ].! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test05PlayerXShouldRespectTurns
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithXAt: 1 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: (TicTaeToe notTurnErrorMessageFor: 'x')
				equals: anError messageText.
			self assert: game playCountForX = 1.
			self assert: (game isPositionMarkedWithX: 1 @ 1).
			self assert: game playCountForO = 0 ].! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:49:55'!
test06PlayerOShouldRespectTurns

	"Hay mas tests sobre posiciones ocupadas en BoardPositionTest"
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	self
		should: [ game markWithOAt: 1 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: (TicTaeToe notTurnErrorMessageFor: 'o')
				equals: anError messageText.
			self assert: game playCountForX = 1.
			self assert: (game isPositionMarkedWithX: 1 @ 1).
			self assert: game playCountForO = 1.
			self assert: (game isPositionMarkedWithO: 2 @ 1) ].! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test07PositionAlreadyUsed
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTaeToe positionTakenErrorMessage
				equals: anError messageText.
			self assert: game playCountForX = 1.
			self assert: (game isPositionMarkedWithX: 1 @ 1).
			self assert: game playCountForO = 1.
			self assert: (game isPositionMarkedWithO: 2 @ 1) ].! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test08AddingInvalidPositionShouldRaiseError
	| game |
	game _ TicTaeToe new.
	self
		should: [ game markWithXAt: 4 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTaeToe invalidPositionErrorMessage
				equals: anError messageText.
			self assert: game playCountForX = 0 ].! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test09TheGameIsNotOver
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test10NobodyWins
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test11XWinsWhenFillingCol
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self deny: game hasPlayerOWon.
	self assert: game hasPlayerXWon.
	self assert: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test12XWinsWhenFillingCol
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self deny: game hasPlayerOWon.
	self assert: game hasPlayerXWon.
	self assert: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test13XWinsWhenFillingRow
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self deny: game hasPlayerOWon.
	self assert: game hasPlayerXWon.
	self assert: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test14XWinsWhenFillingDiagonal
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 3.
	game markWithXAt: 3 @ 3.
	self deny: game hasPlayerOWon.
	self assert: game hasPlayerXWon.
	self assert: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test15OWinsWhenFillingCol
	"hacemos un solo test para gano O porque los demas ya pasarian dado que usa la misma implementacion que gano X"
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 3 @ 1.
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self assert: game isOver.! !

!TicTaeToeTest methodsFor: 'as yet unclassified' stamp: 'pf 5/31/2018 15:48:11'!
test16IsTied
	| game |
	game _ TicTaeToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 1 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 2 @ 3.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self assert: game isTied.
	self deny: game hasPlayerOWon.
	self deny: game hasPlayerXWon.
	self assert: game isOver.! !


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


!BoardPositionOState methodsFor: 'error' stamp: 'pf 5/31/2018 15:48:11'!
throwErrorWhenPositionIsMarked
	self error: TicTaeToe positionTakenErrorMessage.! !


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


!BoardPositionXState methodsFor: 'error' stamp: 'pf 5/31/2018 15:48:11'!
throwErrorWhenPositionIsMarked
	self error: TicTaeToe positionTakenErrorMessage.! !


!classDefinition: #GameState category: #TicTaoTest!
Object subclass: #GameState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!GameState methodsFor: 'evaluating' stamp: 'MB 5/30/2018 20:05:52'!
hasPlayerOWon

	^self subclassResponsibility.! !

!GameState methodsFor: 'evaluating' stamp: 'MB 5/30/2018 19:46:35'!
hasPlayerXWon

	^self subclassResponsibility.! !

!GameState methodsFor: 'evaluating' stamp: 'MB 5/30/2018 19:46:44'!
isOver

	^self subclassResponsibility.! !

!GameState methodsFor: 'evaluating' stamp: 'MB 5/30/2018 19:46:48'!
isPlayingO

	^self subclassResponsibility.! !

!GameState methodsFor: 'evaluating' stamp: 'MB 5/30/2018 19:46:51'!
isPlayingX

	^self subclassResponsibility.! !

!GameState methodsFor: 'evaluating' stamp: 'MB 5/30/2018 19:46:54'!
isTied

	^self subclassResponsibility.! !



!GameState methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 14:16:10'!
markWithO: aPosition andGiveNextStatefor: aGame

	^self subclassResponsibility.
! !

!GameState methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 14:02:56'!
markWithX: aPosition andGiveNextStatefor: aGame

	^self subclassResponsibility ! !


!classDefinition: #PlayerTurn category: #TicTaoTest!
GameState subclass: #PlayerTurn
	instanceVariableNames: 'selfWonState tiedGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerTurn methodsFor: 'private' stamp: 'pf 5/31/2018 15:21:24'!
currentPlayerWon: aGame

	^self subclassResponsibility.! !


!PlayerTurn methodsFor: 'row cols and diagonals' stamp: 'pf 5/31/2018 15:31:05'!
checkThereIsColRowOrDiagonalFor: positions

	
	^ (self hasCompletedRow: positions) or: [
		(self hasCompletedColumn: positions) or: [
			(self hasDownDiagonal: positions) or: [ self hasUpDiagonal: positions ]]].! !

!PlayerTurn methodsFor: 'row cols and diagonals' stamp: 'pf 5/31/2018 15:31:35'!
hasCompletedColumn: positions

	^ (1 to: 3) anySatisfy: [ :col |
		(positions count: [ :position |
			position y = col ]) = 3 ].! !

!PlayerTurn methodsFor: 'row cols and diagonals' stamp: 'pf 5/31/2018 15:31:48'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :col |
		(positions count: [ :position |
			position x = col ]) = 3 ].! !

!PlayerTurn methodsFor: 'row cols and diagonals' stamp: 'pf 5/31/2018 15:32:12'!
hasDownDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :xy |
		positions anySatisfy: [ :position | (position x = xy) and: (position y = xy) ]].! !

!PlayerTurn methodsFor: 'row cols and diagonals' stamp: 'pf 5/31/2018 15:32:27'!
hasUpDiagonal: positions

	^ (1 to: 3) allSatisfy: [ :xy |
		positions anySatisfy: [ :position | (position x = xy) and: (position y = (4 - xy)) ]].! !


!PlayerTurn methodsFor: 'give next state' stamp: 'pf 5/31/2018 15:29:59'!
giveNextStateFor: aGame

	"este es un template method privado. currentPlayerWon se implementa solo en PlayerXTurn y PlayerOTurn. Lo mismo para oponentTurnState "

	aGame boardComplete ifTrue:[^tiedGame].
	
	(self currentPlayerWon: aGame) ifTrue: [^selfWonState].
	
	^self oponentTurnState.! !


!classDefinition: #PlayerOTurn category: #TicTaoTest!
PlayerTurn subclass: #PlayerOTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerOTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:06:53'!
hasPlayerOWon

	^false.! !

!PlayerOTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:06:59'!
hasPlayerXWon

	^false.! !

!PlayerOTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:07:06'!
isOver

	^false.! !

!PlayerOTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:07:13'!
isPlayingO

	^true.! !

!PlayerOTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:07:20'!
isPlayingX

	^false.! !

!PlayerOTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:07:28'!
isTied

	^false.! !


!PlayerOTurn methodsFor: 'private' stamp: 'pf 5/31/2018 15:22:02'!
currentPlayerWon: aGame

	^self checkThereIsColRowOrDiagonalFor: aGame positionsMarkedWithO.

	 

	! !

!PlayerOTurn methodsFor: 'private' stamp: 'pf 5/31/2018 14:35:04'!
oponentTurnState
	
	^PlayerXTurn new.
	 

	! !


!PlayerOTurn methodsFor: 'initialize' stamp: 'pf 5/31/2018 15:00:59'!
initialize
	
	tiedGame  := TiedGame new.
	selfWonState := WinPlayerO new.! !


!PlayerOTurn methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 14:17:24'!
markWithO: aPosition andGiveNextStatefor: aGame

	aPosition markWithO.
	
	^self giveNextStateFor: aGame.! !

!PlayerOTurn methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithX: aPosition andGiveNextStatefor: aGame
	self error: (TicTaeToe notTurnErrorMessageFor: 'x').! !


!classDefinition: #PlayerXTurn category: #TicTaoTest!
PlayerTurn subclass: #PlayerXTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!PlayerXTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:00'!
hasPlayerOWon

	^false.! !

!PlayerXTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:06'!
hasPlayerXWon

	^false.! !

!PlayerXTurn methodsFor: 'evaluating' stamp: 'pf 5/31/2018 15:00:50'!
initialize
	
	tiedGame  := TiedGame new.
	selfWonState := WinPlayerX new.! !

!PlayerXTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:11'!
isOver

	^false.! !

!PlayerXTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:25'!
isPlayingO

	^false.! !

!PlayerXTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:31'!
isPlayingX

	^true.! !

!PlayerXTurn methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:38'!
isTied

	^false.! !


!PlayerXTurn methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithO: aPosition andGiveNextStatefor: aGame
	self error: (TicTaeToe notTurnErrorMessageFor: 'o').! !

!PlayerXTurn methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 14:39:27'!
markWithX: aPosition andGiveNextStatefor: aGame

	aPosition markWithX.
	
	^self giveNextStateFor: aGame.! !


!PlayerXTurn methodsFor: 'private' stamp: 'pf 5/31/2018 15:21:49'!
currentPlayerWon: aGame

	^self checkThereIsColRowOrDiagonalFor: aGame positionsMarkedWithX.
! !

!PlayerXTurn methodsFor: 'private' stamp: 'pf 5/31/2018 14:34:50'!
oponentTurnState
	
	^PlayerOTurn new.! !


!classDefinition: #TiedGame category: #TicTaoTest!
GameState subclass: #TiedGame
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TiedGame methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:48'!
hasPlayerOWon

	^false.! !

!TiedGame methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:52'!
hasPlayerXWon

	^false.! !

!TiedGame methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:09:59'!
isOver

	^true.! !

!TiedGame methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:10:04'!
isPlayingO

	^false.! !

!TiedGame methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:10:08'!
isPlayingX

	^false.! !

!TiedGame methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:10:17'!
isTied

	^true.! !


!TiedGame methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithOAt: aPosition andGiveNextStatefor: aGame
	^ self error: TicTaeToe cannotPlayAfterGameOveredErrorMessage.! !

!TiedGame methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithXAt: aPosition andGiveNextStatefor: aGame
	^ self error: TicTaeToe cannotPlayAfterGameOveredErrorMessage.! !


!classDefinition: #WinPlayerO category: #TicTaoTest!
GameState subclass: #WinPlayerO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!WinPlayerO methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:01'!
hasPlayerOWon

	^true.! !

!WinPlayerO methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:11'!
hasPlayerXWon

	^false.! !

!WinPlayerO methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:18'!
isOver

	^true.! !

!WinPlayerO methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:22'!
isPlayingO

	^false.! !

!WinPlayerO methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:25'!
isPlayingX

	^false.! !

!WinPlayerO methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:29'!
isTied

	^false.! !


!WinPlayerO methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithO: aPosition andGiveNextStatefor: aGame
	^ self error: TicTaeToe cannotPlayAfterGameOveredErrorMessage.! !

!WinPlayerO methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithX: aPosition andGiveNextStatefor: aGame
	^ self error: TicTaeToe cannotPlayAfterGameOveredErrorMessage.! !


!classDefinition: #WinPlayerX category: #TicTaoTest!
GameState subclass: #WinPlayerX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!WinPlayerX methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:39'!
hasPlayerOWon

	^false.! !

!WinPlayerX methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:47'!
hasPlayerXWon

	^true.! !

!WinPlayerX methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:53'!
isOver

	^true.! !

!WinPlayerX methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:13:56'!
isPlayingO

	^false.! !

!WinPlayerX methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:14:00'!
isPlayingX

	^false.! !

!WinPlayerX methodsFor: 'evaluating' stamp: 'MB 5/30/2018 21:14:03'!
isTied

	^false.! !


!WinPlayerX methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithO: aPosition andGiveNextStatefor: aGame
	^ self error: TicTaeToe cannotPlayAfterGameOveredErrorMessage.! !

!WinPlayerX methodsFor: 'mark and give next state' stamp: 'pf 5/31/2018 15:48:11'!
markWithX: aPosition andGiveNextStatefor: aGame
	^ self error: TicTaeToe cannotPlayAfterGameOveredErrorMessage.! !


!classDefinition: #TicTaeToe category: #TicTaoTest!
Object subclass: #TicTaeToe
	instanceVariableNames: 'gameState board'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTaoTest'!

!TicTaeToe methodsFor: 'mark' stamp: 'pf 5/31/2018 14:29:39'!
markWithOAt: aPoint
	
	gameState := gameState markWithO: (self boardPositionFor: aPoint) andGiveNextStatefor: self.! !

!TicTaeToe methodsFor: 'mark' stamp: 'pf 5/31/2018 14:39:42'!
markWithXAt: aPoint
			
	gameState := gameState markWithX: (self boardPositionFor: aPoint) andGiveNextStatefor: self.! !


!TicTaeToe methodsFor: 'game state' stamp: 'MB 5/30/2018 23:37:51'!
hasPlayerOWon

	^ gameState hasPlayerOWon.
 		! !

!TicTaeToe methodsFor: 'game state' stamp: 'MB 5/30/2018 23:38:15'!
hasPlayerXWon

	^ gameState hasPlayerXWon.
 		! !

!TicTaeToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:46'!
isOver
	^ gameState isOver.! !

!TicTaeToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:34'!
isPlayingO
	^ gameState isPlayingO.! !

!TicTaeToe methodsFor: 'game state' stamp: 'MB 5/30/2018 20:11:28'!
isPlayingX
	^ gameState isPlayingX.! !

!TicTaeToe methodsFor: 'game state' stamp: 'MB 5/30/2018 23:34:23'!
isTied

	^ gameState isTied.
 		! !


!TicTaeToe methodsFor: 'private' stamp: 'MB 5/30/2018 23:42:00'!
boardComplete

	^ board allSatisfy: [ :position | position markedWithO or: position markedWithX ].
 		! !

!TicTaeToe methodsFor: 'private' stamp: 'pf 5/31/2018 15:48:11'!
boardPositionFor: aPoint
	[ ^ (board select: [ :position |
		position x = aPoint x and: position y = aPoint y ]) first ]
		on: Error
		do: [ self error: TicTaeToe invalidPositionErrorMessage ].! !

!TicTaeToe methodsFor: 'private' stamp: 'pf 5/31/2018 14:19:04'!
positionsMarkedWithO

	^(board select: [ :position | position markedWithO ]) copy.
 		! !

!TicTaeToe methodsFor: 'private' stamp: 'pf 5/31/2018 14:18:56'!
positionsMarkedWithX

	^(board select: [ :position | position markedWithX ]) copy.
 		! !


!TicTaeToe methodsFor: 'initialize' stamp: 'pf 5/31/2018 11:57:53'!
initialize

	board := OrderedCollection new.
	gameState := PlayerXTurn new.
	
	#(1 2 3 ) do: [:x | #(1 2 3) do: [:y | board add: (BoardPosition initializeWith: x@y).]]
	
	! !


!TicTaeToe methodsFor: 'test' stamp: 'MB 5/30/2018 20:08:44'!
isPositionMarkedWithO: aPoint

	^(self boardPositionFor: aPoint) markedWithO.! !

!TicTaeToe methodsFor: 'test' stamp: 'MB 5/30/2018 19:32:28'!
isPositionMarkedWithX: aPoint

	^(self boardPositionFor: aPoint) markedWithX.! !

!TicTaeToe methodsFor: 'test' stamp: 'MB 5/30/2018 20:52:42'!
playCountForO

	^ (board select: [ :position | position markedWithO ]) size.! !

!TicTaeToe methodsFor: 'test' stamp: 'MB 5/30/2018 20:52:48'!
playCountForX

	^ (board select: [ :position | position markedWithX ]) size.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTaeToe class' category: #TicTaoTest!
TicTaeToe class
	instanceVariableNames: ''!

!TicTaeToe class methodsFor: 'as yet unclassified' stamp: 'MB 5/30/2018 21:16:28'!
cannotPlayAfterGameOveredErrorMessage

	^'no se puede jugar cuando el juego termino'.! !

!TicTaeToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:59:03'!
invalidPositionErrorMessage

	^'posicion invalida'.! !

!TicTaeToe class methodsFor: 'as yet unclassified' stamp: 'pf 5/28/2018 13:02:48'!
notTurnErrorMessageFor: xOrO

	^'no es el turno de ', xOrO! !

!TicTaeToe class methodsFor: 'as yet unclassified' stamp: 'PF 5/28/2018 19:04:05'!
positionTakenErrorMessage

	^ 'Posicion ocupada'! !
