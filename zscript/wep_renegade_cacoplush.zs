//-------------------------------------------------
//"swampyrad, please don't turn me into a marketable plushie."
//*vine boom sound*
//***earrape cacodemon alert sound***
//-------------------------------------------------

//Renegade cacoplush requested by BenitezClance4 from the HDest Discord server

class RenegadeCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a Renegade cacodemon plushie... Clance, is that you?";
		inventory.icon "RCPLA0";
		tag "Renegade Cacodemon Plushie";
		hdweapon.refid "RCP";
	}

override string,double getpickupsprite(bool usespare){
		return "RCPLA0",1.;
	}

	states{
	select0:
		RCPF A 0;
		goto selectcaco;

	spawn:
		RCPL A -1;
		stop;
	
	}
}

