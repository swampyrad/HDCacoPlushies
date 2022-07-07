//-------------------------------------------------
// Slava Ukraini!
//-------------------------------------------------
class UkraineCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a cacodemon plushie. Slava Ukraini!";
		inventory.icon "UCPLA0";
		tag "Ukraine Cacodemon Plushie";
		hdweapon.refid "UCP";
	}

override string,double getpickupsprite(bool usespare){
		return "UCPLA0",1.;
	}

	states{
	select:
		UCPF A 0;
		goto selectcaco;

	spawn:
		UCPL A -1;
		stop;
	
	}
}

