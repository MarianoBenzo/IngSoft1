!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'PF 4/12/2018 20:54:28'!
setUp

	customerBook := CustomerBook  new.! !

!IdiomTest methodsFor: 'testing' stamp: 'PF 4/12/2018 21:22:56'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self 	assertAClosure: [customerBook addCustomerNamed: 'John Lennon'] 
			executionDoesNotTakeMoreThan: 50
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'PF 4/12/2018 21:23:40'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	
	self 	assertAClosure: [customerBook removeCustomerNamed: paulMcCartney]
			executionDoesNotTakeMoreThan: 100
	
! !

!IdiomTest methodsFor: 'testing' stamp: 'PF 4/12/2018 21:50:45'!
test03CanNotAddACustomerWithEmptyName 

	self evaluating: [ customerBook addCustomerNamed: ''] 
		shouldRaise: Error 
		andAssert: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!IdiomTest methodsFor: 'testing' stamp: 'PF 4/12/2018 21:52:18'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	self evaluating: [ customerBook removeCustomerNamed: 'Paul McCartney'] 
		shouldRaise: NotFound 
		andAssert: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]! !


!IdiomTest methodsFor: 'auxiliar methods' stamp: 'PF 4/12/2018 21:21:57'!
assertAClosure: aClosure executionDoesNotTakeMoreThan: aNumber


	| millisecondsBeforeRunning millisecondsAfterRunning |
	  
	millisecondsBeforeRunning := Time millisecondClockValue.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < aNumber 
	! !

!IdiomTest methodsFor: 'auxiliar methods' stamp: 'PF 4/12/2018 21:50:15'!
evaluating: aClosure shouldRaise: anErrorType andAssert: aClosureWithAssertions

	[ aClosure value.
	self fail ]
		on: anErrorType
		do: [ :anError | aClosureWithAssertions value: anError]
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IdiomTest class' category: #'CodigoRepetido-Ejercicio'!
IdiomTest class
	instanceVariableNames: 'customerBook'!


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
