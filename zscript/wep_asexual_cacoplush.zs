//-------------------------------------------------
// ace
//-------------------------------------------------
class AcePrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a asexual pride cacodemon plushie.";
		inventory.icon "ASPLA0";
		tag "Ace Pride Cacodemon Plushie";
		hdweapon.refid "asp";
	}

override string,double getpickupsprite(bool usespare){
		return "ASPLA0",1.;
	}

	states{
	select:
		ASPF A 0;
		goto selectcaco;

	spawn:
		ASPL A -1;
		stop;
	
	}
}

