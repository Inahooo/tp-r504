
##def puissance (a,b) :
##	if not type(a) is int:
##		raise TypeError("Only integers are allowed")
##	if not type(b) is int:
##		raise TypeError("Only integers are allowed")
##	return a**b

def puissance (a,b) :
	if not type(a) is int:
		if not type(b)is int:
			a**b
	else:
		if b==0:
			return 1
		elif b >0:
			resultat = a
			for _ in range(1,b):
				resultat *= a
			return resultat
		else:
			return 1/puissance (a,-b)
