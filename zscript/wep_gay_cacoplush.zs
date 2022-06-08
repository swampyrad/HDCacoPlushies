//-------------------------------------------------
// "What is love? Baby don't hurt me..."
//-------------------------------------------------
class GayPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a gay pride cacodemon plushie. Love is love!";
		inventory.icon "GCPLA0";
		tag "Gay Pride Cacodemon Plushie";
		hdweapon.refid "gcp";
	}

override string,double getpickupsprite(bool usespare){
		return "GCPLA0",1.;
	}

	states{
	select:
		GCPF A 0;
		goto selectcaco;

	spawn:
		GCPL A -1;
		stop;
	
	}
}

