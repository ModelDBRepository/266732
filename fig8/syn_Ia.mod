COMMENT
Tonic afferent input from muscle spindle is modeled as a membrane mechanism.
ENDCOMMENT
					       
NEURON {
	SUFFIX IaSyn
	RANGE gmax, e, i, del, dur, pkamp, bias, g
	NONSPECIFIC_CURRENT i
}
UNITS {
	(nA) = (nanoamp)
	(mV) = (millivolt)
	(S) = (siemens)
}

PARAMETER {
	gmax=0 	(S/cm2)	<0,1e9>
	e=0	(mV)
	
	del=0   (ms)
    dur=20000   (ms)
    pkamp=1       
	bias=0 
}

ASSIGNED {
	v (mV)
	i (mA/cm2)
	g (S/cm2)
}

BREAKPOINT {
	g = gmax * m(t)
	i = g*(v - e)
}

FUNCTION m(x) {
	at_time(del)
    at_time(del + dur)

    if (t < del) {
       m=0   
    } else { 
        if (t < del+dur/2) {
            m = (2*pkamp/dur)*t + bias
        } else{ 
            m = -(2*pkamp/dur)*(t-dur) + bias
		}
	}
}