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

!I class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:30:27'!
/ unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) 
		ifTrue: [^self]
		ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 22:06:53'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:43:24'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]! !

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


!I class methodsFor: 'nil' stamp: 'PF 4/1/2018 16:26:10'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !


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

!II class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:50:54'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/31/2018 21:58:45'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 3/30/2018 23:37:42'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:34:06'!
dividirPor: dividendo contador: contador

	

		! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:42:51'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!II class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:27:02'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

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

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
dividirPor: dividendo contador: contador

	

		! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
previous

	^previous! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!III class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:51:57'!
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

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
dividirPor: dividendo contador: contador

	

		! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
previous

	^previous! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:52:23'!
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

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:02'!
dividirPor: dividendo contador: contador

	

		! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:03'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:03'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:03'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:03'!
previous

	^previous! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:03'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:03'!
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

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
dividirPor: dividendo contador: contador

	

		! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:04'!
previous

	^previous! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:05'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:05'!
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

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
dividirPor: dividendo contador: contador

	

		! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
previous

	^previous! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:06'!
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

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
* unNumeroDePeano
	^(self previous * unNumeroDePeano)  + unNumeroDePeano! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
- unNumeroDePeano

	^unNumeroDePeano restaYMultuplicaPorMenosUno: self


! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
/ unNumeroDePeano

	[self - unNumeroDePeano ] on: Error do: [ (self isEqualTo: unNumeroDePeano) ifFalse: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor]].	
	
	^(self) dividirPor: unNumeroDePeano contador: I numeradorOriginal: self. 
	! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^'no se puede dividir por un numero mayor'! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'Negativos no soportados'.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
dividirPor: dividendo contador: contador

	

		! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:07'!
dividirPor: dividendo contador: contador numeradorOriginal: numeradorOriginal

	((contador * dividendo) esMayorOIgualQue: numeradorOriginal) 
		ifTrue:[^contador]
		ifFalse:[^(self-dividendo) dividirPor: dividendo contador: (contador + I) numeradorOriginal: numeradorOriginal ]



	

		! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:08'!
esMayorOIgualQue: unNumeroDePeano

	(self isEqualTo: unNumeroDePeano) ifTrue: [^true].
	
	[unNumeroDePeano - self] on: Error do: [^true].
	
	^false.! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:08'!
next

	next ifNil:
	[next := self cloneNamed: (self name, 'I').
		
	next previous: self.
		
		
		
].

^next
 ! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:08'!
previous

	^previous! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:08'!
previous: unNumeroDePeano

	previous:= unNumeroDePeano! !

!IIIIIIII class methodsFor: 'as yet unclassified' stamp: 'PF 4/1/2018 16:53:08'!
restaYMultuplicaPorMenosUno: unNumeroDePeano

	^unNumeroDePeano previous - self previous! !

IIIIIIII instVarNamed: 'next' put: nil!
IIIIIIII instVarNamed: 'previous' put: IIIIIII!