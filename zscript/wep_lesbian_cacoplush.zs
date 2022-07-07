//-------------------------------------------------
// *lesbian fish noises*
//-------------------------------------------------
class LesbianPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a lesbian pride cacodemon plushie. Love is love!";
		inventory.icon "LCPLA0";
		tag "Lesbian Pride Cacodemon Plushie";
		hdweapon.refid "lcp";
	}

override string,double getpickupsprite(bool usespare){
		return "LCPLA0",1.;
	}

	states{
	select:
		LCPF A 0;
		goto selectcaco;

	spawn:
		LCPL A -1;
		stop;
	
	}
}

