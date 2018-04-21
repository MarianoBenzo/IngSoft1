!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #Node category: #'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:20:01'!
getElement
	^ self subclassResponsibility.! !

!Node methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:20:04'!
isEmpty
	^ self subclassResponsibility.! !


!classDefinition: #NodeBase category: #'Stack-Exercise'!
Node subclass: #NodeBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodeBase methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:48:39'!
getElement
	^ self error: OOStack stackEmptyErrorDescription.! !

!NodeBase methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:16:26'!
isEmpty
	^ true.! !


!classDefinition: #NodeElement category: #'Stack-Exercise'!
Node subclass: #NodeElement
	instanceVariableNames: 'previous element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NodeElement methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:20:57'!
getElement
	^ element.! !

!NodeElement methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:29:14'!
getPrevious
	^ previous.! !

!NodeElement methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:19:19'!
initializeWithElement: aElement previous: aNode
	element := aElement.
	previous := aNode.! !

!NodeElement methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:20:43'!
isEmpty
	^ false.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NodeElement class' category: #'Stack-Exercise'!
NodeElement class
	instanceVariableNames: ''!

!NodeElement class methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:23:08'!
withElement: aElement previous: aNode
	^ self new initializeWithElement: aElement previous: aNode! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'top size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:45:00'!
initialize
	top := NodeBase new.
	size := 0.
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:12:27'!
isEmpty
	^ top isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:33:41'!
pop

	| popElement |
	
	popElement := top getElement.
	top := top getPrevious.
	size := size - 1.
	
	^ popElement.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:33:15'!
push: element
	| newElement |
	
	newElement := NodeElement withElement: element previous: top. 
	
	top := newElement.
	
	size := size + 1.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:34:29'!
size
	^ size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:31:49'!
top
	^ top getElement.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'as yet unclassified' stamp: 'MB 4/21/2018 18:02:43'!
new
	^ self basicNew initialize! !
