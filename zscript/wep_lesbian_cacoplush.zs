//-------------------------------------------------
// *lesbian fish noises*
//-------------------------------------------------
class LesbianPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a lesbian pride cacodemon plushie. Love is love!";
		inventory.icon "LCPLA0";
		tag "Lesbian Pride Cacodemon Plushie";
		hdweapon.refid "lcp";
	}

override string,double getpickupsprite(bool usespare){
		return "LCPLA0",1.;
	}

	states{
	select:
		LCPF A 0;
		goto select0;

	ready:
		LCPF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   LCPF A 0;
  goto super::fire;

	spawn:
		LCPL A -1;
		stop;
	
	}
}

