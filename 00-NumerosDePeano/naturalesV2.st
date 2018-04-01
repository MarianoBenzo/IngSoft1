!classDefinition: #I category: #naturales!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #naturales!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/26/2018 21:31:49'!
* unNumeroDePeano

	^unNumeroDePeano! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:06:57'!
+ unNumeroDePeano

	^unNumeroDePeano next! !

!I class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 17:53:35'!
- unNumeroDePeano

	^ unNumeroDePeano ! !

!I class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 18:53:15'!
/ unNumeroPeano
	unNumeroPeano = self
	ifTrue: [^self]
	ifFalse: [self error: 'No se puede dividir por un numero mayor']! !

!I class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 19:54:09'!
< unNumeroPeano
	unNumeroPeano = I
	ifTrue: [^false]
	ifFalse: [^true]
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:02:07'!
next
	 
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:05:20'!
previous

	self error: 'El numero 1 no tiene numero previo'.! !


!classDefinition: #II category: #naturales!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #naturales!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 17:53:41'!
* unNumeroDePeano

	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:09:42'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 17:54:40'!
- unNumeroDePeano

	^ unNumeroDePeano - self previous 
! !

!II class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 19:46:46'!
/ unNumeroPeano
	unNumeroPeano = I
	ifTrue: [^self]
	ifFalse: [
		unNumeroPeano = self
		ifTrue: [^I]
		ifFalse: [
			unNumeroPeano < self
			ifTrue: [
				self - unNumeroPeano < unNumeroPeano
				ifTrue: [^ I]
				ifFalse: [^ I + ((self - unNumeroPeano ) / unNumeroPeano )] 
				]
			ifFalse: [
				self error: 'No se puede dividir un a un numero mayor'
				]
			]
		]! !

!II class methodsFor: 'as yet unclassified' stamp: 'MB 3/31/2018 19:54:15'!
< unNumeroPeano

	unNumeroPeano = I
	ifTrue: [^ false]
	ifFalse: [^ (self previous < unNumeroPeano previous)]! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:19:08'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/26/2018 21:18:16'!
previous

	^previous! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:20:29'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

II instVarNamed: 'next' put: AnObsoleteIII!
II instVarNamed: 'previous' put: I!