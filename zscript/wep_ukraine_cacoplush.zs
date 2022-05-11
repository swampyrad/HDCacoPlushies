//-------------------------------------------------
// *squeako*
//-------------------------------------------------
class UkraineCacoPlushDoll:CacoPlushDoll{
	default{
		-hdweapon.droptranslation
   weapon.slotnumber 7;
		weapon.slotpriority 9;
		inventory.pickupmessage "Picked up a cacodemon plushie. Slava Ukraini!";
		inventory.icon "UCPLA0";
  bouncefactor 2.;
		scale 1;
		tag "Ukraine Cacodemon Plushie";
		hdweapon.refid "UCP";
	}

override string,double getpickupsprite(bool usespare){
		return "UCPLA0",1.;
	}

	states{
	select0:
		UCPF A 0{
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
		UCPF A 0;
		---- AAA 1 A_Lower();
		---- A 1 A_Lower(18);
		---- A 1 A_Lower(24);
		---- A 1 A_Lower(30);
		wait;

	ready:
		UCPF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   UCPF A 0 A_StartSound("plush/squeak",9);
		UCPF ABCCBA 2 A_AlertMonsters(1);
  goto nope;

//throw code borrowed from Potetobloke Weapons Pack,
//specifically the PS-451 single-use plasma gun
altreload:
  YEET:
  UCPF A 1;
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
		UCPL A -1;
		stop;
	
	}
}

