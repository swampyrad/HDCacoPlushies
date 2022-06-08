//-------------------------------------------------
// *squeako*
//-------------------------------------------------
class AgenderPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up an agender pride cacodemon plushie.";
		inventory.icon "AGPLA0";
		tag "Agender Pride Cacodemon Plushie";
		hdweapon.refid "AGP";
	}

override string,double getpickupsprite(bool usespare){
		return "AGPLA0",1.;
	}

	states{
	select:
		AGPF A 0;
		goto selectcaco;

	spawn:
		AGPL A -1;
		stop;
	
	}
}

