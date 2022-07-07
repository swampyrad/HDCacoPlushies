//-------------------------------------------------
// b i
//-------------------------------------------------
class BisexualCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a bisexual pride cacodemon plushie. Bicon!";
		inventory.icon "BCPLA0";
		tag "Bi Pride Cacodemon Plushie";
		hdweapon.refid "bcp";
	}

override string,double getpickupsprite(bool usespare){
		return "BCPLA0",1.;
	}

	states{
	select:
		BCPF A 0;
		goto selectcaco;

	spawn:
		BCPL A -1;
		stop;
	
	}
}

