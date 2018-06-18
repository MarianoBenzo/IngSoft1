!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: #TusLibros!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 20:43:44'!
debit: anAmount from: aCreditCard
	^ testObjectsFactory debitResponse value.
	! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:11'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:46:03'!
test01CanNotCheckoutAnEmptyCart

	| salesBook clientId |
	
	salesBook := Dictionary new.
	clientId := '0001'.
	
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory unexpiredCreditCard 
			on: testObjectsFactory today
			registeringClient: clientId
			on:  salesBook
			with: self ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:46:22'!
test02CalculatedTotalIsCorrect

	| salesBook clientId cart cashier |
	
	salesBook := Dictionary new.
	clientId := '0001'.
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier toCheckout: cart 
							charging: testObjectsFactory unexpiredCreditCard 
							on: testObjectsFactory today 
							registeringClient: clientId
							on:  salesBook
							with: self.
							
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:47:03'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook clientId merchantProcessorWasCalled |
	
	merchantProcessorWasCalled := false.
	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := Dictionary new.
	clientId := '0001'.
	
	testObjectsFactory setDebitResponse: [merchantProcessorWasCalled := true].
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				on: testObjectsFactory today
				registeringClient: clientId
				on:  salesBook
				with: self ]
			
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty.
			self deny: merchantProcessorWasCalled]! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:48:43'!
test04CheckoutRegistersASale

	| cart cashier salesBook clientId total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := Dictionary new.
	clientId := '0001'.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory unexpiredCreditCard 
		on: testObjectsFactory today
		registeringClient: clientId
		on:  salesBook
		with: self.
		
	total := cashier checkOut.
					
	self assert: (salesBook includesKey: clientId).
	self assert: (salesBook at: clientId) first total = total.! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:47:51'!
test05CheckoutWithStolenCreditCardShouldRaiseException

	| cart cashier salesBook clientId |
	
	cart _ testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook _ Dictionary new.
	clientId := '0001'.
	
	testObjectsFactory setDebitResponse: [^self error:  Cashier canNotChargeAStolenCreditCardErrorMessage].
	
	cashier _ Cashier
		toCheckout: cart
		charging: testObjectsFactory unexpiredCreditCard 
		on: testObjectsFactory today
		registeringClient: clientId
		on:  salesBook
		with: self.
	
	self
		should: [ cashier checkOut. ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotChargeAStolenCreditCardErrorMessage.
			self assert: salesBook isEmpty ].! !

!CashierTest methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:48:00'!
test06CheckoutWithCreditCardWithoutCreditShouldRaiseException

	| cart cashier salesBook clientId |
	
	cart _ testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook _ Dictionary new.
	clientId := '0001'.
	
	testObjectsFactory setDebitResponse: [^self error:  Cashier canNotChargeACreditCardWithoutCreditErrorMessage].
	
	cashier _ Cashier
		toCheckout: cart
		charging: testObjectsFactory unexpiredCreditCard 
		on: testObjectsFactory today
		registeringClient: clientId
		on:  salesBook
		with: self.
		
	self
		should: [ cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier canNotChargeACreditCardWithoutCreditErrorMessage.
			self assert: salesBook isEmpty ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierTest class' category: #TusLibros!
CashierTest class
	instanceVariableNames: ''!

!CashierTest class methodsFor: 'as yet unclassified' stamp: 'MB 6/13/2018 21:56:34'!
canNotDebitAnExpiredCreditCardErrorMessage
	^'Can not debit an expired credit card'! !


!classDefinition: #ShopTest category: #TusLibros!
TestCase subclass: #ShopTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ShopTest methodsFor: 'as yet unclassified' stamp: 'MB 6/17/2018 01:13:16'!
debit: anAmount from: aCreditCard
	^ testObjectsFactory debitResponse value.
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'MB 6/17/2018 00:15:42'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 14:02:12'!
test01CartCanBeCreated
	
		| shop cartId |
		
		shop := testObjectsFactory createShop.		
	
		cartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		self assert: shop cartsAmount = 1.
		self assert: (shop listCart: cartId) isEmpty.
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:52:03'!
test02ProductsCanBeAddedToCart
	
		| shop cartId |
		
		shop := testObjectsFactory createShop.
		
		cartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		shop 	addToCart: cartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 2
				at: Time now.
		
		self assert: shop cartsAmount = 1.
		self assert: (shop ocurrencesOf: testObjectsFactory itemSellByTheStore for: cartId) = 2.
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:54:12'!
test03CartCanBeListed
	
		| shop cartId list |
		
		shop := testObjectsFactory createShop.
		
		cartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		shop 	addToCart: cartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 2
				at: Time now.
				
		list := shop listCart: cartId.
		
		self assert: list notEmpty.
		self assert: (list occurrencesOf: testObjectsFactory itemSellByTheStore) = 2.
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:54:18'!
test04PurchasesForClientCanBeListed
	
		| shop cartId sales |
		
		shop := testObjectsFactory createShop.
				
		cartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		shop 	addToCart: cartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 2
				at: Time now.
				
		shop checkOutCart: cartId withCard: testObjectsFactory unexpiredCreditCard.
		
		sales := shop listPurchasesFor: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		self assert: sales size = 1.
		self assert: (sales at:testObjectsFactory itemSellByTheStore)  = 2 
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:54:46'!
test04PurchasesForClientCanBeListedForMultipleCarts
	
		| shop cartId sales anotherCartId|
		
		shop := testObjectsFactory createShop.
				
		cartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		anotherCartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		shop 	addToCart: cartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 2
				at: Time now.
				
	    shop 	addToCart: anotherCartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 3
				at: Time now.		
				
		shop checkOutCart: cartId withCard: testObjectsFactory unexpiredCreditCard.
		shop checkOutCart: anotherCartId withCard: testObjectsFactory unexpiredCreditCard.
		
		sales := shop listPurchasesFor: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		self assert: sales size = 1.
		self assert: (sales at:testObjectsFactory itemSellByTheStore)  = 5
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:54:29'!
test04PurchasesForClientCanBeListedForMultipleCartsAndDifferentProducts
	
		| shop cartId sales anotherCartId|
		
		shop := testObjectsFactory createShop.
				
		cartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		anotherCartId := shop createCartForClient: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		shop 	addToCart: cartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 2
				at: Time now.
				
	     shop 	addToCart: anotherCartId 
				book: testObjectsFactory anotherItemSellByTheStore 
				quantity: 3
				at: Time now.		
				
		shop checkOutCart: cartId withCard: testObjectsFactory unexpiredCreditCard.
		shop checkOutCart: anotherCartId withCard: testObjectsFactory unexpiredCreditCard.
		
		sales := shop listPurchasesFor: testObjectsFactory validClientId password: testObjectsFactory validClientPass.
		
		self assert: sales size = 2.
		self assert: (sales at:testObjectsFactory itemSellByTheStore)  = 2.
		self assert: (sales at:testObjectsFactory anotherItemSellByTheStore)  = 3! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 15:11:22'!
test05CreateCartForInvalidClientIdShouldRaiseError

		| shop cartId|
		
		shop := testObjectsFactory createShop.				
		
		self
			should: [ cartId := shop createCartForClient: 'invalidId' password: testObjectsFactory validClientPass.. ]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [ :anError |	self assert: anError messageText = Shop invalidClientOrPasswordErrorMessage.
											self assert: cartId = nil ].
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 15:12:13'!
test05CreateCartForInvalidPasswordShouldRaiseError

		| shop cartId|
		
		shop := testObjectsFactory createShop.				
		
		self
			should: [ cartId := shop createCartForClient: testObjectsFactory validClientId password: 'invalidPassword' ]
			raise: Error - MessageNotUnderstood
			withExceptionDo: [ :anError |	self assert: anError messageText = Shop invalidClientOrPasswordErrorMessage.
											self assert: cartId = nil ].
		! !

!ShopTest methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:58:38'!
test06CannotAccessCartAfter30Minutes

		| shop cartId|
		
		shop := testObjectsFactory createShop.
		
		"la idea de este test es que hay qyue pasarle el momento de ahora mas 30 minutos"
						
		"
		self
			should: [ shop 	addToCart: cartId 
				book: testObjectsFactory itemSellByTheStore 
				quantity: 2
				at: 'hora de ahora mas 30 minutos'.]
			
			raise: Error - MessageNotUnderstood
			withExceptionDo: [ :anError |	self assert: anError messageText = Shop tooMuchTimePassedErrorMessage.
											].
		"! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'id catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'MB 6/16/2018 20:20:59'!
initializeAcceptingItemsOf: aCatalog andCartId: aCartId

	catalog := aCatalog.
	items := OrderedCollection new.
	id := aCartId.! !


!Cart methodsFor: 'queries' stamp: 'MB 6/16/2018 20:25:31'!
id
	^ id.! !

!Cart methodsFor: 'queries' stamp: 'pf 6/18/2018 14:16:49'!
listItems
	^ items copy.! !

!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:04'!
catalog
	
	^ catalog! !

!Cart methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:05'!
itemsDo: aBlock
	
	^items do: aBlock ! !


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

!Cart class methodsFor: 'instance creation' stamp: 'MB 6/16/2018 20:21:15'!
acceptingItemsOf: aCatalog andCartId: aCartId
	
	^self new initializeAcceptingItemsOf: aCatalog andCartId: aCartId.! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'cart creditCard salesBook merchantProcesorInterface clientId'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 23:19:40'!
checkOut
	
	| priceList total |
	
	priceList := cart catalog.
	total := 0.
	cart itemsDo: [ :anItem | total := total + (priceList at: anItem)].
	
	merchantProcesorInterface debit: total from: creditCard.
	
	(salesBook includesKey: clientId) ifFalse: [ salesBook at: clientId put: OrderedCollection new].
	
	(salesBook at: clientId) add: (Sale ofItems: cart listItems withTotal: total).
	
	^total! !

!Cashier methodsFor: 'as yet unclassified' stamp: 'MB 6/16/2018 22:33:36'!
initializeToCheckout: aCart charging: aCreditCard registeringClient: aClientId on: aSalesBook with: aMerchantProcessorInterface
	
	cart := aCart.
	creditCard := aCreditCard.
	clientId := aClientId.
	salesBook := aSalesBook.
	merchantProcesorInterface  := aMerchantProcessorInterface.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'MB 6/16/2018 23:36:50'!
toCheckout: aCart charging: aCreditCard on: aDate registeringClient: aClientId on: aSalesBook with: aMerchantProcessorInterface
 
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard registeringClient: aClientId on: aSalesBook with: aMerchantProcessorInterface ! !


!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'error messages' stamp: 'MB 6/11/2018 21:08:04'!
canNotChargeACreditCardWithoutCreditErrorMessage
	
	^'Can not charge a card without credit'! !

!Cashier class methodsFor: 'error messages' stamp: 'MB 6/11/2018 21:06:33'!
canNotChargeAStolenCreditCardErrorMessage
	
	^'Can not charge a stolen credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration number owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 19:46:46'!
initializeExpiringOn: aMonth withNumber: aCreditCardNumber for: anOwner
	
	expiration := aMonth. 
	number := aCreditCardNumber.
	owner := anOwner.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 20:09:41'!
number
	
	^number copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 19:46:11'!
expiringOn: aMonth withNumber: aCreditCardNumber for: anOwner
	
	^self new initializeExpiringOn: aMonth withNumber: aCreditCardNumber for: anOwner! !


!classDefinition: #MerchantProcessorSimulator category: #TusLibros!
Object subclass: #MerchantProcessorSimulator
	instanceVariableNames: 'debitResponse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorSimulator methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 13:52:51'!
debit: anAmount from: aCreditCard
	^ debitResponse value.! !

!MerchantProcessorSimulator methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 13:59:06'!
initialize
	debitResponse := ['ok']! !

!MerchantProcessorSimulator methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 13:53:23'!
setDebitResponse: aClosure
 	debitResponse := aClosure.! !


!classDefinition: #Sale category: #TusLibros!
Object subclass: #Sale
	instanceVariableNames: 'total items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 14:49:28'!
itemsDo: aClosure
	
	items do: aClosure.
! !

!Sale methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'MB 6/16/2018 22:01:33'!
initializeItems: anItems withTotal: aTotal

	items := anItems.
	total := aTotal.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #TusLibros!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'MB 6/16/2018 22:00:49'!
ofItems: anItems withTotal: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeItems: anItems withTotal: aTotal ! !


!classDefinition: #Shop category: #TusLibros!
Object subclass: #Shop
	instanceVariableNames: 'carts catalog cartIdCounter transactionIdCounter merchantProcessor clients salesBook lastAccessByCart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:53:57'!
addToCart: aCartId book: aBook quantity: aQuantity at: aMoment
	
	
	self validCart: aCartId.
	
	(((aMoment - (lastAccessByCart at: aCartId)) seconds) > (30*60)) ifTrue: [self error: Shop tooMuchTimePassedErrorMessage].
	

	carts keysDo: [ :cart | cart id = aCartId ifTrue: [ cart add: aQuantity of: aBook ] ].
	
	lastAccessByCart at: aCartId put: aMoment.! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 13:21:41'!
cartsAmount
	
	^ carts size! !

!Shop methodsFor: 'as yet unclassified' stamp: 'MB 6/17/2018 00:07:54'!
checkOutCart: aCartId withCard: aCreditCard
	
	| cashier cart clientId |
	
	self validCart: aCartId.
	
	carts keysDo: [ :cartKey | cartKey id = aCartId ifTrue: [ cart := cartKey. clientId := carts at: cartKey ]].
	
	cashier := Cashier 	toCheckout: cart  
							charging: aCreditCard 
							on:  Date today 
							registeringClient: clientId 
							on: salesBook 
							with: merchantProcessor.
	
	cashier checkOut.
	
	transactionIdCounter := transactionIdCounter + 1.
	
	^ transactionIdCounter.
	
	
	

	
	! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:43:30'!
createCartForClient: aClientId password: aPassword
	
	| cart cartId |
	
	cartId := cartIdCounter.
	cartIdCounter := cartIdCounter + 1.
	
	self validClient: aClientId password: aPassword.
	
	cart := Cart new initializeAcceptingItemsOf: catalog andCartId: cartId.
	
	carts at: cart put: aClientId.
	
	lastAccessByCart at: cartId put: Time now.
	
	^ cartId.! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 16:41:25'!
initializeWithCatalog: aCatalog andMerchantProcessor: aMerchantProcessorInterface forClients: clientsIdsAndPasswords 

	carts := Dictionary new.
	catalog := aCatalog.
	cartIdCounter := 0.
	transactionIdCounter := 0.
	merchantProcessor := aMerchantProcessorInterface.
	clients := clientsIdsAndPasswords.
	salesBook := Dictionary new.
	lastAccessByCart  := Dictionary new.
	! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 14:17:04'!
listCart: aCartId

	self validCart: aCartId.

	carts keysDo: [ :cart | cart id = aCartId ifTrue: [ ^ cart listItems copy ] ]! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 14:50:13'!
listPurchasesFor: aClientId password: aPassword

	|_salesBook result|

	self validClient: aClientId password: aPassword.
			
	_salesBook  := salesBook at: aClientId copy.
	
	result := Dictionary new.
	
	_salesBook do: [:sale | sale itemsDo: [:item | (result includesKey: item) ifTrue: [result at: item put: ((result at: item) + 1)] ifFalse:[result at: item put: 1]]].
	
	^result.	
	
	! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 14:10:10'!
ocurrencesOf: aProduct for: aCartId
	
	|_cart|

	carts keysDo: [ :cart | cart id = aCartId ifTrue: [_cart := cart]].
	
	^_cart occurrencesOf: aProduct! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 15:07:17'!
validCart: aCartId.

	(carts keys anySatisfy: [ :cart | cart id = aCartId ])
		ifFalse: [ self error: self class invalidCartErrorMessage ].! !

!Shop methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 15:09:48'!
validClient: aClientId password: aPassword

	(clients includesKey: aClientId)ifFalse: [ self error: self class invalidClientOrPasswordErrorMessage].
	
	(clients at: aClientId) = aPassword
		ifFalse: [ self error: self class invalidClientOrPasswordErrorMessage].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Shop class' category: #TusLibros!
Shop class
	instanceVariableNames: ''!

!Shop class methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 15:04:22'!
invalidCartErrorMessage
	^ 'Cart invalido'! !

!Shop class methodsFor: 'as yet unclassified' stamp: 'pf 6/18/2018 15:04:08'!
invalidClientOrPasswordErrorMessage
	^ 'Cliente Id o la contraseña no son validos'! !


!Shop class methodsFor: 'instance creation' stamp: 'pf 6/18/2018 16:41:09'!
initializeWithCatalog: aCatalog andMerchantProcessor: aMerchantProcessorInterface forClients: clientsIdsAndPasswords 
	^ self new initializeWithCatalog: aCatalog andMerchantProcessor: aMerchantProcessorInterface forClients: clientsIdsAndPasswords.! !

!Shop class methodsFor: 'instance creation' stamp: 'pf 6/18/2018 16:50:20'!
tooMuchTimePassedErrorMessage

	^'ya pasaron 30 minutios'! !


!classDefinition: #StoreTestObjectsFactory category: #TusLibros!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today debitResponse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'MB 6/16/2018 23:32:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog andCartId: '001'! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 16:42:10'!
createShop
	
	^Shop initializeWithCatalog: self defaultCatalog andMerchantProcessor: (MerchantProcessorSimulator new) forClients: self shopClients.! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 14:54:43'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		at: self anotherItemSellByTheStore put: (self itemSellByTheStorePrice*2);
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 14:01:03'!
inValidClientId
	
	^2! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 14:01:15'!
inValidClientPass
	
	^'invalidPass'! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 14:00:49'!
shopClients
	
	|result|
	
	result := Dictionary new.
	
	result at: self validClientId put: self validClientPass.
	
	^result.! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 14:00:09'!
validClientId
	
	^1! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'pf 6/18/2018 14:00:25'!
validClientPass
	
	^'pass1'! !


!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 20:42:28'!
debitResponse

	^ debitResponse.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 20:41:24'!
expiredCreditCard
	
	^CreditCard 
		expiringOn: (Month month: today monthIndex year: today yearNumber - 1) 
		withNumber: '0002'
		for: 'Owner expired card'! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'MB 6/13/2018 21:57:37'!
initialize

	today := DateAndTime now.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'MB 6/11/2018 20:37:39'!
setDebitResponse: aClosure
	
	^ debitResponse := aClosure.! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !

!StoreTestObjectsFactory methodsFor: 'as yet unclassified' stamp: 'pf 6/13/2018 22:55:46'!
unexpiredCreditCard

	"lo unico que sabemos es que no expiro. no sabemos si es robada, si tiene saldo, etc, eso lo determinada el merchant processor"
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1) 
					withNumber: '0001' 
					for: 'Owner'! !


!StoreTestObjectsFactory methodsFor: 'items' stamp: 'pf 6/18/2018 14:55:08'!
anotherItemSellByTheStore
	
	^ 'anotherValidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !
