//-------------------------------------------------
// aro
//-------------------------------------------------
class AroCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a aromantic pride cacodemon plushie.";
		inventory.icon "ARPLA0";
		tag "Aro Pride Cacodemon Plushie";
		hdweapon.refid "arp";
	}

override string,double getpickupsprite(bool usespare){
		return "ARPLA0",1.;
	}

	states{
	select0:
		ARPF A 0;
		goto selectcaco;

	spawn:
		ARPL A -1;
		stop;
	
	}
}

