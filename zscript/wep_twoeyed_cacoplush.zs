//-------------------------------------------------
// *squeako*
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
	select0:
		C2PF A 0{
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
		C2PF A 0;
		---- AAA 1 A_Lower();
		---- A 1 A_Lower(18);
		---- A 1 A_Lower(24);
		---- A 1 A_Lower(30);
		wait;

	ready:
		C2PF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   C2PF A 0 A_CacoTaunt();

		C2PF BCCBA 2;
  goto nope;

//throw code borrowed from Potetobloke Weapons Pack,
//specifically the PS-451 single-use plasma gun
altreload:
  YEET:
  C2PF A 1;
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
		C2PL A -1;
		stop;
	
	}
}

