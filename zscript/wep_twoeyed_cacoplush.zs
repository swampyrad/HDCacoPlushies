//-------------------------------------------------
// *squeako×2*
//-------------------------------------------------
class TwoEyedCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a cacodemon plushie. It has two eyes...";
		inventory.icon "C2PLA0";
		tag "Two-eyed Cacodemon Plushie";
		hdweapon.refid "C2P";
	}

override string,double getpickupsprite(bool usespare){
		return "C2PLA0",1.;
	}

	states{
	select:
		C2PF A 0;
		goto selectcaco;

	spawn:
		C2PL A -1;
		stop;
	
	}
}

