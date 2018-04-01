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

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:15:43'!
- unNumeroDePeano

	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados ! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:28:20'!
/ unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^self].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 22:06:53'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 22:57:49'!
dividirPor: dividendo contador: contador
	
	
		
	^contador next.! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:02:07'!
next
	 
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:05:20'!
previous

	self error: 'El numero 1 no tiene numero previo'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 19:11:51'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous! !


!I class methodsFor: 'mensajes' stamp: 'PF 3/30/2018 23:36:42'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !


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

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/26/2018 21:38:30'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/22/2018 21:09:42'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 19:10:32'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:28:04'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 21:24:03'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 21:58:45'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/30/2018 23:37:42'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:27:41'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
			ifTrue: [^contador next]
			ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

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

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 19:14:08'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #naturales!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #naturales!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
		ifTrue: [^contador next]
		ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
previous

	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:24'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #naturales!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #naturales!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
		ifTrue: [^contador next]
		ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
previous

	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:28'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIII instVarNamed: 'next' put: IIIII!
IIII instVarNamed: 'previous' put: III!

!classDefinition: #IIIII category: #naturales!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #naturales!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:38'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:38'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
		ifTrue: [^contador next]
		ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
previous

	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:39'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIIII instVarNamed: 'next' put: IIIIII!
IIIII instVarNamed: 'previous' put: IIII!

!classDefinition: #IIIIII category: #naturales!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #naturales!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
		ifTrue: [^contador next]
		ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
previous

	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:47'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIIIII instVarNamed: 'next' put: IIIIIII!
IIIIII instVarNamed: 'previous' put: IIIII!

!classDefinition: #IIIIIII category: #naturales!
DenotativeObject subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIII class' category: #naturales!
IIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
		ifTrue: [^contador next]
		ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
previous

	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:51'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIIIIII instVarNamed: 'next' put: IIIIIIII!
IIIIIII instVarNamed: 'previous' put: IIIIII!

!classDefinition: #IIIIIIII category: #naturales!
DenotativeObject subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIIIII class' category: #naturales!
IIIIIIII class
	instanceVariableNames: 'next previous'!

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:54'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:54'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:54'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
/ unNumeroDePeano


	(self isEqualTo: unNumeroDePeano) ifTrue: [^I].
	[self - unNumeroDePeano ] on: Error do: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ].	
	^(self - unNumeroDePeano) dividirPor: unNumeroDePeano contador: I. 
	! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
aLaMenosUno: unNumeroDePeano


	^(unNumeroDePeano - self) / (self previous)! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
dividirPor: dividendo contador: contador
		
		[ self - dividendo] on: Error do: [^contador next].
		
		(self isEqualTo: dividendo)
		ifTrue: [^contador next]
		ifFalse: [^((self - dividendo) dividirPor: dividendo contador: (contador next))]
		! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
previous

	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 23:23:55'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIIIIIII instVarNamed: 'next' put: nil!
IIIIIIII instVarNamed: 'previous' put: IIIIIII!