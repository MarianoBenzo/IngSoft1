!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'MB 6/7/2018 18:45:50'!
test09CanNotAddNonIntegerNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0.5 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'MB 6/7/2018 20:31:00'!
test10CanNotCheckOutEmptyCart

	| cart cashier |
	
	cart := self createCart.
	
	cashier := self createCashier.
		
	self 
		should: [cashier checkOut: cart withCreditCard: self validCreditCard atDate: self today]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier invalidCartErrorMessage. ]! !

!CartTest methodsFor: 'tests' stamp: 'MB 6/7/2018 20:31:05'!
test11CheckOutCartWithAProduct

	| cart cashier |
	
	cart := self createCart.
	cart add: self itemSellByTheStore.
	cashier := self createCashier.
		
	self assert: (cashier checkOut: cart withCreditCard: self validCreditCard atDate: self today) = self itemSellByTheStorePrice ! !

!CartTest methodsFor: 'tests' stamp: 'MB 6/7/2018 20:31:11'!
test12CheckOutCartWithRepeatedProduct

	| cart cashier |
	
	cart := self createCart.
	cart add: 3 of: self itemSellByTheStore.
	cashier := self createCashier.
		
	self assert: (cashier checkOut: cart withCreditCard: self validCreditCard atDate: self today) = (self itemSellByTheStorePrice * 3)! !

!CartTest methodsFor: 'tests' stamp: 'MB 6/7/2018 20:31:15'!
test13CheckOutCartWithDiferentProducts

	| cart cashier |
	
	cart := self createCart.
	cart add: 3 of: self itemSellByTheStore.
	cart add: 2 of: self anotherItemSellByTheStore.
	cashier := self createCashier.
		
	self assert: (cashier checkOut: cart withCreditCard: self validCreditCard atDate: self today) = ((self itemSellByTheStorePrice * 3) + (self anotherItemSellByTheStorePrice * 2))! !

!CartTest methodsFor: 'tests' stamp: 'MB 6/7/2018 20:28:48'!
test14CheckOutCartWithAnInvalidCreditCard

	| cart cashier |
	
	cart := self createCart.
	cart add: 3 of: self itemSellByTheStore.
	cart add: 2 of: self anotherItemSellByTheStore.
	
	cashier := self createCashier.	
	
	self 
		should: [cashier checkOut: cart withCreditCard: self invalidCreditCard atDate: self today]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier invalidCardErrorMessage. ]! !


!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 19:29:36'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 19:29:20'!
anotherItemSellByTheStorePrice
	
	^peso * 3.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 18:55:35'!
createCashier
	
	^Cashier new.! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 19:30:13'!
defaultCatalog
	
	|priceCatalog|
	
	priceCatalog :=  Dictionary new.
	
	priceCatalog at: self itemSellByTheStore put: self itemSellByTheStorePrice.
	priceCatalog at: self anotherItemSellByTheStore put: self anotherItemSellByTheStorePrice.
	
	^priceCatalog.! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 20:30:24'!
invalidCreditCard
	
	^ CreditCard initializeWithNumber: '0002' expirationDate: (Date year: 2018 month: 1 day: 1) owner: 'Owner Invalid'.! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 19:07:30'!
itemSellByTheStorePrice
	
	^peso * 2.! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 20:29:02'!
today
	
	^Date year: 2018 month: 2 day: 1! !

!CartTest methodsFor: 'support' stamp: 'MB 6/7/2018 20:30:06'!
validCreditCard
	
	^ CreditCard initializeWithNumber: '0001' expirationDate: (Date year: 2019 month: 1 day: 1) owner: 'Owner Valid'.! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'priceCatalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 19:17:57'!
itemsDo: aClosure

	items do: aClosure.! !


!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'MB 6/7/2018 19:12:59'!
assertIsValidItem: anItem

	(priceCatalog keys includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'MB 6/7/2018 18:45:12'!
assertIsValidQuantity: aQuantity

	(aQuantity strictlyPositive and: aQuantity isInteger) ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'MB 6/7/2018 19:13:26'!
initializeAcceptingItemsOf: aPriceCatalog

	priceCatalog := aPriceCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !

!Cart methodsFor: 'queries' stamp: 'pf 6/11/2018 15:58:47'!
priceFor: anItem

	"TODO: ver si seria mejor que este mensaje lo sepa responder el cashier en vez del cart. en este momento no lo podemos pasar al cashier porque el cashier no conoce la lista de precios. probablemente debiera conocerla"

	^ priceCatalog at: anItem. ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:11:31'!
bookNotInTheCatalogErrorMessage

	^'cannot add books not included in the catalog'! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:05:21'!
initializeWith: aCatalog

	^self new initializeWith: aCatalog.! !


!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'pf 6/11/2018 16:02:12'!
checkOut: aCart withCreditCard: aCard atDate: aDate

	|result|
	
	result := peso * 0.
	
	aCart isEmpty 
		ifTrue: [ self error: Cashier invalidCartErrorMessage. ].
		
	(aCard hasExpiredFor: aDate)
		ifTrue: [ self error: Cashier invalidCardErrorMessage ].
		
	aCart itemsDo: [:item | result := result + (aCart priceFor: item) ].
	
	self debit: result from: aCard.
	
	^result.! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'pf 6/11/2018 15:56:50'!
debit: anAmount from: creditCard

	"todo: llamar al merchant processor"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 19:47:24'!
invalidCardErrorMessage
	^ 'La tarjeta de credito no es valida'! !

!Cashier class methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 18:56:57'!
invalidCartErrorMessage
	^ 'El carrito es invalido'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'number expirationDate owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 20:21:56'!
hasExpiredFor: aDate

	^  expirationDate < aDate.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 19:43:48'!
initializeWithNumber: aNumber expirationDate: anExpirationDate owner: anOwner
	number := aNumber.
	expirationDate := anExpirationDate.
	owner := anOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 19:55:17'!
initializeWithNumber: aNumber expirationDate: anExpirationDate owner: anOwner

	^ self new initializeWithNumber: aNumber expirationDate: anExpirationDate owner: anOwner.! !
