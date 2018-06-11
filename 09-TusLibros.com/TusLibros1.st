!classDefinition: #YourBooksTest category: #YourBooks!
TestCase subclass: #YourBooksTest
	instanceVariableNames: 'cart book1 book2 book3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:17:40'!
setUp

	|catalog|
	
	book1:= Book withIsbn: '1-1'.
	book2:= Book withIsbn: '2-2'.
	book3:= Book withIsbn: '3-3'.
	
	catalog := OrderedCollection new.
	catalog add: book1.
	catalog add: book2.
	catalog add: book3.
	
	
	cart := Cart initializeWith: catalog.
	! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 19:30:15'!
test01CartInitializesEmpty

	|cart|
	
	cart := Cart new.
	
	self assert: cart isEmpty.! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:01:09'!
test02AddProductToTheCart
	
	cart add: book1.
	self assert: (cart includes: book1).! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:02:19'!
test03AddMulltipleProductsToTheCart

	cart add: book1.
	cart add: book2.
	self assert: (cart includes: book1).
	self assert: (cart includes: book2).
	self deny: (cart includes: book3).! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:02:30'!
test05AddMultipleProductsWithQuantityToTheCart
	
	cart
		add: book1
		quantity: 1.
	cart
		add: book2
		quantity: 2.
	cart
		add: book3
		quantity: 3.	
	self assert: (cart occurrencesOf: book1) = 1.
	self assert: (cart occurrencesOf: book2) = 2.
	self assert: (cart occurrencesOf: book3) = 3.! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:03:51'!
test06BooksWithSameIsbnAreTheSameBook
	|book bookWithSameIsbn|

	book _ Book withIsbn: '1-1'.
	bookWithSameIsbn _ Book withIsbn: '1-1'.
	cart add: book.
	cart add: bookWithSameIsbn.
	self assert: book = bookWithSameIsbn.
	self assert: (cart occurrencesOf: bookWithSameIsbn) = 2.! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:10:56'!
test07AddingBookNotInTheCatalogShouldRaiseException

	|bookNotInTheCatalog|
	
	bookNotInTheCatalog  := Book withIsbn: '4-4'.
	
		self
		should: [cart add: bookNotInTheCatalog ] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: Cart bookNotInTheCatalogErrorMessage equals: anError messageText.].
	
	
! !


!classDefinition: #Book category: #YourBooks!
Object subclass: #Book
	instanceVariableNames: 'isbn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!

!Book methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 13:07:44'!
= aBook
  ^ isbn = aBook isbn
! !

!Book methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:56:24'!
hash 
  ^ isbn hash
! !

!Book methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 13:05:36'!
isbn
  ^ isbn copy
! !

!Book methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:10:43'!
withIsbn: anIsbn

	isbn := anIsbn! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Book class' category: #YourBooks!
Book class
	instanceVariableNames: ''!

!Book class methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:10:02'!
withIsbn: anIsbn
	^self new withIsbn: anIsbn! !


!classDefinition: #Cart category: #YourBooks!
Object subclass: #Cart
	instanceVariableNames: 'books id catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:19:20'!
add: aProduct
	
		self add: aProduct quantity: 1.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:14:03'!
add: aBook quantity: aQuantity

		(catalog includes: aBook) ifFalse: [self error: Cart bookNotInTheCatalogErrorMessage].
	
		^books add: aBook withOccurrences: aQuantity.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:26:43'!
includes: aProduct
	
		^books includes: aProduct.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:26:46'!
initialize

	books := Bag new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:05:39'!
initializeWith: aCatalog

	catalog := aCatalog.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:26:50'!
isEmpty
	
		^books isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 12:29:07'!
occurrencesOf: aBook
	
		^books occurrencesOf: aBook.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #YourBooks!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:11:31'!
bookNotInTheCatalogErrorMessage

	^'cannot add books not included in the catalog'! !

!Cart class methodsFor: 'as yet unclassified' stamp: 'pf 6/7/2018 14:05:21'!
initializeWith: aCatalog

	^self new initializeWith: aCatalog.! !
