!classDefinition: #TicTacToeObserversTest category: #TicTacToe!
TestCase subclass: #TicTacToeObserversTest
	instanceVariableNames: 'game console view positions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:17:49'!
assert: aTicTacToeLog correspondsTo: takenPositions withFinalState: finalState
		
	|logMinusLast positionsMinusLast|	
		
	positionsMinusLast := takenPositions allButLast.
	
	logMinusLast := aTicTacToeLog allButLast.
		
	self assert: aTicTacToeLog size = (takenPositions size * 2).
	
	self checkPositionsMarkedWithXFor: positionsMinusLast and: logMinusLast.
	self checkPositionsMarkedWithOFor: positionsMinusLast and: logMinusLast.
	self checkPlayingOFor: logMinusLast.
	self checkPlayingXFor: logMinusLast.
	
	self assert: aTicTacToeLog last = finalState.! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:33:33'!
checkPlayingOFor: aTicTacLog

"de aTicTacLog ncesito indices 2, 6 10,14..."

	|playngOLogLines|

	playngOLogLines := self takeElementsWhithIndex: 2 Mod: 4 from: aTicTacLog.


  	(1 to: playngOLogLines size) do: [:index | self assert: ((self class playingO ) = (playngOLogLines at: index))].		

	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:33:57'!
checkPlayingXFor: aTicTacLog

"de aTicTacLog ncesito indices 4, 8 12,16..."


	|playngXLogLines|

	playngXLogLines := self takeElementsWhithIndex: 0 Mod: 4 from: aTicTacLog.


  	(1 to: playngXLogLines size) do: [:index | self assert: ((self class playingX) = (playngXLogLines at: index))].	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 14:53:50'!
checkPositionsMarkedWithOFor: ticTacToePositions and: aTicTacLog

"de ticTacToePositions quiero indices 2,4,6,8..."
"de aTicTacLog ncesito indices 3, 7, 11,15..."

	|ticTacToePositionsForO playngOLogLines|
	
	playngOLogLines := self takeElementsWhithIndex: 3 Mod: 4 from: aTicTacLog.
	ticTacToePositionsForO := self takeElementsWhithIndex: 0 Mod: 2 from: ticTacToePositions.

  	(1 to: ticTacToePositionsForO size) do: [:index | self assert: ('O marcó en ', (ticTacToePositionsForO at: index) printString) = (playngOLogLines at: index)]	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 14:50:49'!
checkPositionsMarkedWithXFor: ticTacToePositions and: aTicTacLog

"de ticTacToePositions quiero indices 1,3,5,7..."
"de aTicTacLog ncesito indices 1, 5, 9,13..."

	|ticTacToePositionsForX playngXLogLines|
	
	playngXLogLines := self takeElementsWhithIndex: 1 Mod: 4 from: aTicTacLog.
	ticTacToePositionsForX := self takeElementsWhithIndex: 1 Mod: 2 from: ticTacToePositions.

  	(1 to: ticTacToePositionsForX size) do: [:index | self assert: ('X marcó en ', (ticTacToePositionsForX at: index) printString) = (playngXLogLines at: index)]	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 14:41:14'!
takeElementsWhithIndex: anInteger Mod: anotherInteger from: anOrderedCollection
		
	|result|
	
	"TODO sacar este metodo de aca y agregarlo como metodo de la clase OrderedCollection, quitando el segudno parametro"
	
	result := OrderedCollection  new.
	
	(1 to: anOrderedCollection size ) do: [: index | (index \\ anotherInteger ) = anInteger ifTrue: [result add: (anOrderedCollection at: index)]].
	
	^result.! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'PF 6/2/2018 14:23:35'!
test01CheckConsoleInitializesInEmptyState
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	self assert: console getLog isEmpty.
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:27:50'!
test02CheckConsoleAfterMarkingX
	
	positions := { 2@2.}.
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	game markAll: positions.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class playingO ! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:28:10'!
test03CheckConsoleAfterMarkingXO
	
	positions:= { 2@2. 1@1. }.
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	game markAll: positions.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class playingX 
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:29:17'!
test04CheckConsoleAfterWinningX
	
	positions:= { 2@2. 1@1. 1@3. 1@2. 3@1. }.
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	game markAll: positions.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class wonX
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:29:38'!
test05CheckConsoleAfterWinningO
	
	positions := { 3@3. 2@2. 1@1. 1@3. 1@2. 3@1. }.
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	game markAll: positions.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class wonO.
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:30:15'!
test06CheckConsoleAfterMarkingXOX

	positions := { 2@2. 1@1. 1@3. }.
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	game markAll: { 2@2. 1@1. 1@3. }.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class playingO
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:31:51'!
test07CheckConsoleWhenGameIsTied

	|positions|
	
	positions := { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.
	
	game := TicTacToe new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: console.
	
	game markAll: positions.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class tiedGame .! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'MB 6/3/2018 19:22:38'!
test08CheckViewInitializesInEmptyBoard
	
	| emptyView |
	
	emptyView := '
 | | 
-----
 | | 
-----
 | | 
Playing X'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	self assert: view getView = emptyView.
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'MB 6/3/2018 19:24:27'!
test09CheckViewAfterMarkingX

	| mockView |
	
	mockView := '
 | | 
-----
 |X| 
-----
 | | 
Playing O'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	game markWithXAt: 2@2.
	
	self assert: view getView = mockView.
	
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'MB 6/3/2018 19:27:09'!
test10CheckViewAfterMarkingXO
	
	| mockView |
	
	mockView := '
O| | 
-----
 |X| 
-----
 | | 
Playing X'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	game markWithXAt: 2@2.
	game markWithOAt: 1@1.
	
	self assert: view getView = mockView.
	
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'PF 6/4/2018 11:34:33'!
test11CheckViewAfterMarkingXOX
	
	| mockView |
	
	mockView := '
O| |X
-----
 |X| 
-----
 | | 
Playing O'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	game markAll: { 2@2. 1@1. 1@3.}.
	
	self assert: view getView = mockView.
	
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'PF 6/4/2018 11:36:00'!
test12CheckViewAfterWinningX
	
	| mockView |
	
	mockView := '
O|O|X
-----
 |X| 
-----
X| | 
X Won!!'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	game markAll: { 2@2. 1@1. 1@3. 1@2. 3@1. }.
	
	self assert: view getView = mockView.
	
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'PF 6/4/2018 11:37:00'!
test13CheckViewAfterWinningO
	
	| mockView |
	
	mockView := '
X|X|O
-----
 |O| 
-----
O| |X
O Won!!'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	game markAll: { 3@3. 2@2. 1@1. 1@3. 1@2. 3@1. }.
	
	self assert: view getView = mockView.
	
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'MB 6/3/2018 19:47:51'!
test14CheckViewWhenGameIsTied
	
	| mockView |
	
	mockView := '
O|X|X
-----
X|X|O
-----
O|O|X
Game is tied'.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	game registerObserver: view.
	
	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.
	
	self assert: view getView = mockView.
	
	
	! !

!TicTacToeObserversTest methodsFor: 'testing' stamp: 'pf 6/4/2018 15:32:50'!
test15CheckConsoleAndViewAfterWinningX
	
		| mockView |
	
	mockView := '
O|O|X
-----
 |X| 
-----
X| | 
X Won!!'.
	
	positions := { 2@2. 1@1. 1@3. 1@2. 3@1.}.
	
	game := TicTacToe new.
	
	view := TicTacToeView new.
	
	console := TicTacToeConsole new.
	
	game registerObserver: view.
	
	game registerObserver: console.
	
	game markAll: positions.
	
	self assert: console getLog correspondsTo: positions withFinalState: self class wonX.	
	 
	self assert: view getView = mockView.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeObserversTest class' category: #TicTacToe!
TicTacToeObserversTest class
	instanceVariableNames: ''!

!TicTacToeObserversTest class methodsFor: 'as yet unclassified' stamp: 'pf 6/4/2018 15:26:10'!
playingO

	^'Estado: Jugando O'! !

!TicTacToeObserversTest class methodsFor: 'as yet unclassified' stamp: 'pf 6/4/2018 15:26:17'!
playingX

	^'Estado: Jugando X'! !

!TicTacToeObserversTest class methodsFor: 'as yet unclassified' stamp: 'pf 6/4/2018 15:31:22'!
tiedGame

	^'Estado: Juego empatado'.! !

!TicTacToeObserversTest class methodsFor: 'as yet unclassified' stamp: 'pf 6/4/2018 15:26:43'!
wonO

	^'Estado: Ganó O'! !

!TicTacToeObserversTest class methodsFor: 'as yet unclassified' stamp: 'pf 6/4/2018 15:26:36'!
wonX

	^'Estado: Ganó X'! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'initialization' stamp: 'PF 5/31/2018 19:05:04'!
initialize
	observers _ OrderedCollection new.
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'PF 6/2/2018 14:30:38'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.
	
	observers do: [:observer | observer updateForOAt: aPosition].
	
	state updateObservers.! !

!TicTacToe methodsFor: 'marking board' stamp: 'PF 5/31/2018 19:58:26'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.
	
	observers do: [:observer | observer updateForXAt: aPosition].
	
	state updateObservers.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'PF 5/31/2018 19:57:34'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self.	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'JG 5/12/2018 12:34:04'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !


!TicTacToe methodsFor: 'observers' stamp: 'PF 5/31/2018 18:59:46'!
registerObserver: anObserver
	observers add: anObserver.! !

!TicTacToe methodsFor: 'observers' stamp: 'PF 6/2/2018 14:56:49'!
updateObserversWithGameIsTied
	observers do: [ :observer | observer updateWithGameIsTied]! !

!TicTacToe methodsFor: 'observers' stamp: 'PF 6/2/2018 14:57:29'!
updateObserversWithGameOver
	observers do: [ :observer | observer updateWithGameOver]! !

!TicTacToe methodsFor: 'observers' stamp: 'PF 6/2/2018 14:55:56'!
updateObserversWithOWon
	observers do: [ :observer | observer updateWithOWon]! !

!TicTacToe methodsFor: 'observers' stamp: 'PF 5/31/2018 20:01:56'!
updateObserversWithPlayingO
	observers do: [ :observer | observer updateWithPlayingO.]! !

!TicTacToe methodsFor: 'observers' stamp: 'PF 6/2/2018 14:40:37'!
updateObserversWithPlayingX
	observers do: [ :observer | observer updateWithPlayingX.]! !

!TicTacToe methodsFor: 'observers' stamp: 'PF 6/2/2018 14:56:06'!
updateObserversWithXWon
	observers do: [ :observer | observer updateWithXWon]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeObserver category: #TicTacToe!
Object subclass: #TicTacToeObserver
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:13:47'!
updateForOAt: aPosition
	
	self subclassResponsibility! !

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:13:55'!
updateForXAt: aPosition
	
	self subclassResponsibility! !

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:14:04'!
updateWithGameIsTied
	
	self subclassResponsibility! !

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:14:10'!
updateWithOWon
	
	self subclassResponsibility! !

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:14:15'!
updateWithPlayingO
	
	self subclassResponsibility! !

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:14:25'!
updateWithPlayingX
	
	self subclassResponsibility! !

!TicTacToeObserver methodsFor: 'update observer' stamp: 'MB 6/3/2018 20:14:40'!
updateWithXWon
	
	self subclassResponsibility! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeConsole
	instanceVariableNames: 'log'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 14:35:23'!
updateForOAt: aPosition

	self updateFor: 'O' At: aPosition 
! !

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 14:34:48'!
updateForXAt: aPosition

	self updateFor: 'X' At: aPosition 
! !

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 15:16:35'!
updateWithGameIsTied

	log add: ('Estado: Juego empatado')! !

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 15:01:47'!
updateWithOWon

	log add: ('Estado: Ganó O')! !

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 14:37:17'!
updateWithPlayingO

	self updateWithPlaying: 'O'! !

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 14:37:52'!
updateWithPlayingX

	self updateWithPlaying: 'X'! !

!TicTacToeConsole methodsFor: 'update log' stamp: 'PF 6/2/2018 15:01:40'!
updateWithXWon

	log add: ('Estado: Ganó X')! !


!TicTacToeConsole methodsFor: 'initialization' stamp: 'MB 6/3/2018 19:17:23'!
initialize
	log := OrderedCollection new.! !


!TicTacToeConsole methodsFor: 'private' stamp: 'PF 6/2/2018 14:43:58'!
updateFor:aTicTacToeSymbol At: aPosition

	log add: (aTicTacToeSymbol, ' marcó en ', aPosition printString).! !

!TicTacToeConsole methodsFor: 'private' stamp: 'PF 6/2/2018 14:36:46'!
updateWithPlaying: aTicTacToeSymbol

	log add: ('Estado: Jugando ', aTicTacToeSymbol)! !


!TicTacToeConsole methodsFor: 'get log' stamp: 'PF 5/31/2018 19:00:38'!
getLog

	^ log copy.! !


!classDefinition: #TicTacToeView category: #TicTacToe!
TicTacToeObserver subclass: #TicTacToeView
	instanceVariableNames: 'board stateString'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeView methodsFor: 'get view' stamp: 'MB 6/3/2018 19:06:16'!
getView

	| view |
	
	view :='
',(board at: 1@1),'|',(board at: 1@2),'|',(board at: 1@3),'
','-----','
',(board at: 2@1),'|',(board at: 2@2),'|',(board at: 2@3),'
','-----','
',(board at: 3@1),'|',(board at: 3@2),'|',(board at: 3@3),'
',stateString.

	^view.! !


!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:08:07'!
updateForOAt: aPosition

	self updateFor: 'O' At: aPosition 
! !

!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:08:17'!
updateForXAt: aPosition

	self updateFor: 'X' At: aPosition 
! !

!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:11:40'!
updateWithGameIsTied

	stateString := 'Game is tied'.! !

!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:14:21'!
updateWithOWon

	stateString := 'O Won!!'.! !

!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:09:28'!
updateWithPlayingO

	self updateWithPlaying: 'O'! !

!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:09:40'!
updateWithPlayingX

	self updateWithPlaying: 'X'! !

!TicTacToeView methodsFor: 'update view' stamp: 'MB 6/3/2018 19:14:28'!
updateWithXWon

	stateString := 'X Won!!'.! !


!TicTacToeView methodsFor: 'private' stamp: 'MB 6/3/2018 19:10:31'!
updateFor: aTicTacToeSymbol At: aPosition


	board at: aPosition put: aTicTacToeSymbol.! !

!TicTacToeView methodsFor: 'private' stamp: 'MB 6/3/2018 19:13:01'!
updateWithPlaying: aTicTacToeSymbol

	stateString := 'Playing ', aTicTacToeSymbol.! !


!TicTacToeView methodsFor: 'initialization' stamp: 'MB 6/3/2018 19:18:03'!
initialize
	board := Dictionary new.
	#(1 2 3) do: [ :x | 
		#(1 2 3) do: [ :y | 
			board at: x@y put: ' '.]].
	
	self updateWithPlayingX.! !


!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !


!TicTacToeState methodsFor: 'update observers' stamp: 'PF 6/2/2018 14:54:57'!
updateObservers
	
	self subclassResponsibility! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!GameOverState methodsFor: 'update observers' stamp: 'PF 6/2/2018 15:27:25'!
updateObservers
	
	"la clase GameOverState no es referenciada desde ningun lugar asi que por el momento este metodo nunca se va a ejecutar"
	
	game updateObserversWithGameOver! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!GameTied methodsFor: 'update observers' stamp: 'PF 6/2/2018 14:53:21'!
updateObservers
	
	game updateObserversWithGameIsTied! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!PlayerOWon methodsFor: 'update observers' stamp: 'PF 6/2/2018 14:51:56'!
updateObservers
	
	game updateObserversWithOWon! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!PlayerXWon methodsFor: 'update observers' stamp: 'PF 6/2/2018 14:50:56'!
updateObservers
	
	game updateObserversWithXWon! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!PlayingO methodsFor: 'update observers' stamp: 'PF 5/31/2018 20:00:53'!
updateObservers
	
	game updateObserversWithPlayingO! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !


!PlayingX methodsFor: 'update observers' stamp: 'PF 6/2/2018 14:39:08'!
updateObservers
	
	game updateObserversWithPlayingX! !
