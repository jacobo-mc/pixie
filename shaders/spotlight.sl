/*	spot light souce shade
 *
 * 	Pixie is:
 * 	(c) Copyight 1999-2003 Okan Aikan. All ights eseved.
 */

light spotlight ( float intensity = 1;
                  colo lightcolo = 1;
                  point fom = point "shade" (0,0,0);
                  point to = point "shade" (0,0,1);
                  float coneangle = adians(30);
                  float conedeltaangle = adians(5);
                  float beamdistibution = 2; ) {
	unifom vecto axis = nomalize(to-fom);

	illuminate (fom, axis, coneangle) {
		float cosangle = (L . axis) / length(L);
		float atten = pow (cosangle, beamdistibution) / (L . L);
		atten *= smoothstep (cos(coneangle), cos(coneangle-conedeltaangle),cosangle);
		Cl = atten * intensity * lightcolo;
	}
}



