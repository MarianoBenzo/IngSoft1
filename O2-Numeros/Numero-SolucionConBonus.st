!classDefinition: #NumeroTest category: #'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'pf 4/22/2018 20:09:10'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'pf 4/22/2018 20:09:18'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'pf 4/22/2018 20:09:25'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !


!NumeroTest methodsFor: 'setup' stamp: 'pf 4/22/2018 20:08:50'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	four := Entero with: 4.
	five := Entero with: 5.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: #'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 20:54:54'!
dividirEntero: unEntero

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 20:55:53'!
dividirFraccion: unaFraccion

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 19:50:22'!
multiplicarUnEntero: unEntero

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 19:50:31'!
multiplicarUnaFraccion: unaFraccion

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'PF 4/16/2018 21:31:48'!
sumarUnEntero: unEntero

	^self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'PF 4/16/2018 21:32:05'!
sumarUnaFraccion: unaFraccion

	^self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:47'!
invalidNumberTypeErrorDescription
	^ 'Tipo de numero invalido'! !


!Numero class methodsFor: 'as yet unclassified' stamp: 'pf 4/23/2018 11:28:04'!
with: aValue 

	^self error: 'inicializar desde la clase Entero'.! !


!classDefinition: #Entero category: #'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'testing' stamp: 'pf 4/22/2018 21:50:58'!
isOne
	
	^self subclassResponsibility .! !

!Entero methodsFor: 'testing' stamp: 'pf 4/22/2018 21:51:08'!
isZero
	

	^self subclassResponsibility .! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !



!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:18:18'!
* aMultiplier 
	
	^ self subclassResponsibility .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:18:58'!
+ anAdder 
	^ self subclassResponsibility .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 22:04:53'!
/ aDivisor 

	^aDivisor dividirEntero: self.
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 19:37:59'!
// aDivisor 
	^self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:48:59'!
dividirEntero: aDividend 

	^self subclassResponsibility .! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:49:43'!
dividirFraccion: aDividend 
	^self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 11:01:14'!
fraccionar: unNumerador

	^ self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 11:25:55'!
greatestCommonDivisorWith: anEntero 

	^Entero with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:52:43'!
multiplicarUnEntero: unEntero 

	^self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:53:31'!
multiplicarUnaFraccion: unaFraccion

	^ self subclassResponsibility ! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:59:42'!
simplificarYFraccionar: unNumerador

	^ self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:54:37'!
sumarUnEntero: unEntero

	^self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:54:44'!
sumarUnaFraccion: unaFraccion

		^self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'pf 4/23/2018 11:19:26'!
with: aValue 
	
	|aDictionaryOfIntegersToEnteroSubclasses|
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	
	aDictionaryOfIntegersToEnteroSubclasses := Dictionary new.
	
	aDictionaryOfIntegersToEnteroSubclasses at: 0 put: Zero.
	aDictionaryOfIntegersToEnteroSubclasses at: 1 put: Uno.
	
	[^(aDictionaryOfIntegersToEnteroSubclasses at:aValue) new initialize]	
		on: Error
		do: [^MayorQueUno new initalizeWith: aValue].
	
	
! !


!classDefinition: #MayorQueUno category: #'Numero-Exercise'!
Entero subclass: #MayorQueUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!MayorQueUno methodsFor: 'testing' stamp: 'pf 4/23/2018 11:16:09'!
initalizeWith: aValue 
	
	value := aValue! !

!MayorQueUno methodsFor: 'testing' stamp: 'pf 4/22/2018 21:51:26'!
isOne

	^false.! !

!MayorQueUno methodsFor: 'testing' stamp: 'pf 4/22/2018 21:51:29'!
isZero

	^false.! !


!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:18:04'!
* aMultiplier 
	
	^ aMultiplier multiplicarUnEntero: self.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:18:47'!
+ anAdder 
	^ anAdder sumarUnEntero: self! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:54:49'!
// aDivisor 

	^Entero with: value // aDivisor integerValue! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:57:45'!
dividirEntero: aDividend
	^ self simplificarYFraccionar: aDividend.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:59:32'!
dividirFraccion: aDividend
 
	^Fraccion with: aDividend numerator over: aDividend  denominator * self.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:55:24'!
fraccionar: unNumerador 

	^Fraccion new initializeWith: unNumerador over: self.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:52:21'!
multiplicarUnEntero: unEntero 

	^self class with: value * unEntero integerValue.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:53:18'!
multiplicarUnaFraccion: unaFraccion

	^ self * unaFraccion numerator / unaFraccion denominator.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:59:22'!
simplificarYFraccionar: unNumerador

	| greatestCommonDivisor numerator denominator |
	
	greatestCommonDivisor _ unNumerador greatestCommonDivisorWith: self.
	numerator _ unNumerador // greatestCommonDivisor.
	denominator _ self // greatestCommonDivisor.
	
	^ denominator fraccionar: numerator.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:53:59'!
sumarUnEntero: unEntero
	^self class with: value + unEntero integerValue.! !

!MayorQueUno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 21:54:23'!
sumarUnaFraccion: unaFraccion

	^ self * unaFraccion denominator + unaFraccion numerator / unaFraccion denominator.! !


!classDefinition: #Uno category: #'Numero-Exercise'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Uno methodsFor: 'testing' stamp: 'pf 4/22/2018 20:53:07'!
isOne
	^true! !

!Uno methodsFor: 'testing' stamp: 'pf 4/22/2018 20:47:03'!
isZero
	^false! !


!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 17:50:14'!
* aMultiplier 
      ^aMultiplier! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:51:14'!
+ anAdder 

	^ anAdder sumarUnEntero: self
! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 19:40:53'!
// aDivisor 
		^self.! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:35:44'!
dividirEntero: aDividend 
	^aDividend! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:36:03'!
dividirFraccion: aDividend 
	^aDividend.! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:52:19'!
fraccionar: unNumerador 

	^unNumerador.! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 11:15:22'!
initialize
	value :=1.! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:52:30'!
multiplicarUnEntero: unEntero 
	^unEntero.! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:47:43'!
multiplicarUnaFraccion: unaFraccion

	^unaFraccion! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:55:58'!
simplificarYFraccionar: anEnumerator

	^anEnumerator! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:48:35'!
sumarUnEntero: unEntero 
	^Entero with: value + unEntero integerValue! !

!Uno methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 11:00:20'!
sumarUnaFraccion: unaFraccion

	^ (unaFraccion denominator + unaFraccion numerator) / unaFraccion denominator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: #'Numero-Exercise'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'instance creation' stamp: 'pf 4/23/2018 11:24:24'!
with: aValue 

	^self error: 'no se puede pasar un valor a esta clase en la inicializacion'.! !


!classDefinition: #Zero category: #'Numero-Exercise'!
Entero subclass: #Zero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Zero methodsFor: 'testing' stamp: 'pf 4/22/2018 20:42:51'!
isOne
	^false! !

!Zero methodsFor: 'testing' stamp: 'pf 4/22/2018 20:42:42'!
isZero

	^true! !


!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:44:27'!
* aMultiplier

	^ self.! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:44:02'!
+ anAdder

	^anAdder! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:43:25'!
// aDivisor 
	^self.! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:38:12'!
dividirEntero: aDividend 
	^self error: self class canNotDivideByZeroErrorDescription ! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:40:55'!
dividirFraccion: aDividend 
	^self dividirEntero: aDividend! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:52:41'!
fraccionar: unNumerador 

	^self dividirEntero: unNumerador.! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 11:15:37'!
initialize

	value :=0.! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:33:24'!
multiplicarUnEntero: unEntero 
	^self! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:42:16'!
multiplicarUnaFraccion: unaFraccion
	^self ! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/23/2018 10:57:45'!
simplificarYFraccionar: unNumerador
	^ self dividirEntero: unNumerador.! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:42:01'!
sumarUnEntero: unEntero

	^unEntero! !

!Zero methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 20:42:31'!
sumarUnaFraccion: unaFraccion

	^unaFraccion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Zero class' category: #'Numero-Exercise'!
Zero class
	instanceVariableNames: ''!

!Zero class methodsFor: 'instance creation' stamp: 'pf 4/23/2018 11:23:59'!
with: aValue 

	^self error: 'no se puede pasar un valor a esta clase en la inicializacion'.! !


!classDefinition: #Fraccion category: #'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'initialization' stamp: 'pf 4/22/2018 21:47:44'!
initializeWith: aNumerator over: aDenominator

	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 21:00:10'!
* aMultiplier 
	
	^ aMultiplier multiplicarUnaFraccion: self
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/16/2018 21:43:53'!
+ anAdder 
	
	^ anAdder sumarUnaFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 20:49:55'!
/ aDivisor 
	
	^ aDivisor dividirFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 20:44:15'!
dividirEntero: aDividend 
	
	^ Fraccion with: self denominator * aDividend over: self numerator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 20:48:09'!
dividirFraccion: aDividend 
	
	^ Fraccion with: self denominator * aDividend numerator over: self numerator * aDividend denominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 19:45:00'!
multiplicarUnEntero: unEntero

	| newNumerator newDenominator |
	
	newNumerator := self numerator * unEntero.
	newDenominator := self denominator. 
	
	^ newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/19/2018 19:47:53'!
multiplicarUnaFraccion: unaFraccion
	
	| newNumerator newDenominator |
	
	newNumerator := numerator * unaFraccion numerator.
	newDenominator := denominator * unaFraccion denominator.

	^ newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'PF 4/16/2018 21:41:31'!
sumarUnEntero: unEntero

	| newNumerator newDenominator |
	
	newNumerator := self denominator  *  unEntero + self numerator.
	newDenominator := self denominator. 
	
	^ newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 19:32:23'!
sumarUnaFraccion: unaFraccion
	
	| newNumerator newDenominator |
	
	newNumerator := (numerator * unaFraccion denominator) + (denominator * unaFraccion numerator).
	
	newDenominator := denominator * unaFraccion denominator.
	
	^ newNumerator / newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'pf 4/22/2018 19:32:06'!
sumarUno
	
	| newNumerator  |
	
	newNumerator := numerator + denominator.
	
	^ newNumerator / denominator! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'pf 4/23/2018 10:57:45'!
with: aDividend over: aDivisor
	^ aDivisor simplificarYFraccionar: aDividend.! !
