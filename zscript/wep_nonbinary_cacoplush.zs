//-------------------------------------------------
// *squeakos in enby*
//-------------------------------------------------
class EnbyPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a nonbinary pride cacodemon plushie.";
		inventory.icon "NBPLA0";
		tag "Nonbinary Pride Cacodemon Plushie";
		hdweapon.refid "NBP";
	}

override string,double getpickupsprite(bool usespare){
		return "NBPLA0",1.;
	}

	states{
	select:
		NBPF A 0;
		goto selectcaco;

	spawn:
		NBPL A -1;
		stop;
	
	}
}

