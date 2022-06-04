//-------------------------------------------------
// *squeako*
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
	select0:
		LCPF A 0{
			A_TakeInventory("NulledWeapon");
			
		}
		#### A 0;
		---- A 1 A_Raise();
		---- A 1 A_Raise(30);
		---- A 1 A_Raise(30);
		---- A 1 A_Raise(24);
		---- A 1 A_Raise(18);
		wait;

	deselect0:
		LCPF A 0;
		---- AAA 1 A_Lower();
		---- A 1 A_Lower(18);
		---- A 1 A_Lower(24);
		---- A 1 A_Lower(30);
		wait;

	ready:
		LCPF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   LCPF A 0 A_CacoTaunt();

		LCPF BCCBA 2;
  goto nope;

//throw code borrowed from Potetobloke Weapons Pack,
//specifically the PS-451 single-use plasma gun
altreload:
  YEET:
  LCPF A 1;
		---- A 1
		{
		if(player&&hdweapon(player.readyweapon)){
		 player.cmd.buttons|=BT_ZOOM;
		 DropInventory(player.readyweapon);
		}
		}
		TNT1 A 0;
  goto nope;

	spawn:
		LCPL A -1;
		stop;
	
	}
}

