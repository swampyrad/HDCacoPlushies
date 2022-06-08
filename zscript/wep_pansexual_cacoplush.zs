//-------------------------------------------------
// "i am going to fry you homophobics." -clance
//-------------------------------------------------
class PanPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a pansexual pride cacodemon plushie.";
		inventory.icon "PSPLA0";
		tag "Pansexual Pride Cacodemon Plushie";
		hdweapon.refid "PSP";
	}

override string,double getpickupsprite(bool usespare){
		return "PSPLA0",1.;
	}

	states{
	select:
		PSPF A 0;
		goto selectcaco;

	spawn:
		PSPL A -1;
		stop;
	
	}
}

