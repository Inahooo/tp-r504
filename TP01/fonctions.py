def puissance (a,b) :
	if not type(a) is int:
		raise TypeError("Only integers are allowed")
	if not type(b) is int:
		raise TypeError("Only integers are allowed")
	print( "Résultat de l'opération a^b : ",(a**b))
