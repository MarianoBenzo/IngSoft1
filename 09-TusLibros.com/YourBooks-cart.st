!classDefinition: #YourBooksTest category: #YourBooks!
TestCase subclass: #YourBooksTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 19:30:15'!
test01CartInitializesEmpty

	|cart|
	
	cart := Cart new.
	
	self assert: cart isEmpty.! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 19:44:37'!
test02AddProductToTheCart

	| cart product |
	
	cart := Cart new.
	product := Product new.
	
	cart add: product.
	
	self assert: (cart includes: product).! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 19:49:07'!
test03AddMulltipleProductsToTheCart

	| cart product1 product2 product3 |
	
	cart := Cart new.
	product1 := Product new.
	product2 := Product new.
	product3 := Product new.
	
	cart add: product1.
	cart add: product2.
	
	self assert: (cart includes: product1).
	self assert: (cart includes: product2).
	self deny: (cart includes: product3).! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 22:01:59'!
test04CartListProducts

	| cart product1 product2 product3 |
	
	cart := Cart new.
	product1 := Product new.
	product2 := Product new.
	product3 := Product new.
	
	cart add: product1.
	cart add: product2.
	cart add: product3.
	
	self assert: ((cart listProducts) includes: product1).
	self assert: ((cart listProducts) includes: product2).
	self assert: ((cart listProducts) includes: product3).! !

!YourBooksTest methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 22:01:11'!
test05AddMultipleProductsWithQuantityToTheCart

	| cart product1 product2 product3 |
	
	cart := Cart new.
	product1 := Product new.
	product2 := Product new.
	product3 := Product new.
	
	cart add: product1 quantity: 1.
	cart add: product2 quantity: 2.
	cart add: product3 quantity: 3.
	
	self assert: ((cart listProducts) occurrencesOf: product1) = 1.
	self assert: ((cart listProducts) occurrencesOf: product2) = 2.
	self assert: ((cart listProducts) occurrencesOf: product3) = 3.! !


!classDefinition: #Cart category: #YourBooks!
Object subclass: #Cart
	instanceVariableNames: 'products id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!

!Cart methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 19:29:26'!
add: aProduct
	
		^products add: aProduct.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 20:12:59'!
add: aProduct quantity: aQuantity
	
		^products add: aProduct withOccurrences: aQuantity.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 19:28:44'!
includes: aProduct
	
		^products includes: aProduct.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 01:09:44'!
initialize

	products := Bag new.
	id := 1. "Genero un id unico".! !

!Cart methodsFor: 'as yet unclassified' stamp: 'PF 6/4/2018 21:42:31'!
isEmpty
	
		^products isEmpty.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'MB 6/6/2018 20:13:37'!
listProducts

		^products.! !


!classDefinition: #Product category: #YourBooks!
Object subclass: #Product
	instanceVariableNames: 'isbn'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!


!classDefinition: #Shop category: #YourBooks!
Object subclass: #Shop
	instanceVariableNames: 'carts purchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'YourBooks'!

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 00:54:02'!
addToCart: aCartId bookWithIsbn: anIsbn andQuantity: aQuantity
	
	(self validBookIsbn: anIsbn)
		ifTrue: [
			"Habria que validar card id"
			(carts at: aCartId) add: anIsbn quantity: aQuantity. 
		]! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 01:09:01'!
checkOutCart: aCartId cnn: aCnn cced: aCced cco: aCco
	"Busco el cart, hago la venta y paso los productos al diccionary purchases con la key = clientId (value en el dicc de carts)"! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 00:49:13'!
createCartFor: aClientId withPassword: aPassword

	| cart |
	
	(self validClient: aClientId withPassword: aPassword) 
		ifTrue: [ 
			cart := Cart new.
			carts at: cart put: aClientId. ]
		ifFalse: [ "Cliente no valido" ]
	! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 00:40:46'!
initialize

	carts := Dictionary new.
	purchases := Dictionary new.! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 01:07:51'!
listCart: aCartId
	"Busco el cart en el diccionario y lo listo"! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 00:39:39'!
listPurchasesForClient: aClientId password: aPassword! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 00:54:16'!
validBookIsbn: anIsbn
	^true.! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/7/2018 00:49:32'!
validClient: aClientId withPassword: aPassword
	^true.! !
