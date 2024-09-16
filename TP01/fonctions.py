
##def puissance (a,b) :
##	if not type(a) is int:
##		raise TypeError("Only integers are allowed")
##	if not type(b) is int:
##		raise TypeError("Only integers are allowed")
##	return a**b

def puissance (a,b):
	if b==0:
		return 1
	if b >0:
		for i in range(1,b):
			a= a*b
		return a
	if b<0:
	return 1/puissance (a,-b)
