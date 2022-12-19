TITLE Muscle length variation

NEURON {
	POINT_PROCESS Xm
	RANGE amp
	USEION cl WRITE cli VALENCE 1
}

UNITS {
	(nA) = (nanoamp)
}

PARAMETER {
	amp = -8	::mm
}

ASSIGNED {
    cli (nA)
}

BREAKPOINT {
	cli = amp
}
