//-------------------------------------------------
// *squeako*
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
		ARPF A 0{
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
		ARPF A 0;
		---- AAA 1 A_Lower();
		---- A 1 A_Lower(18);
		---- A 1 A_Lower(24);
		---- A 1 A_Lower(30);
		wait;

	ready:
		ARPF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   ARPF A 0 A_CacoTaunt();

		ARPF BCCBA 2;
  goto nope;

//throw code borrowed from Potetobloke Weapons Pack,
//specifically the PS-451 single-use plasma gun
altreload:
  YEET:
  ARPF A 1;
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
		ARPL A -1;
		stop;
	
	}
}

