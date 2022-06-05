//-------------------------------------------------
// "Habeus corpus, ya feel me?"
//-------------------------------------------------

//Felonious Bolus design by PilotRedSun

class FeloniousBolus:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a strange bolus. It has a felonious appearance...";
   scale 1;
   bouncefactor 4;
   inventory.pickupsound "felonious/bolus";
		inventory.icon "FBOLA0";
		tag "Felonious Bolus";
		hdweapon.refid "FBO";
	}

override double weaponbulk(){
		return 50;
	}

override string,double getpickupsprite(bool usespare){
		return "FBOLA0",1.;
	}

override void GunBounce(){
		double wb=weaponbulk();
		int dmg=int(throwvel*wb*wb*frandom(0.0001,0.0003));

		if(tracer){
			tracer.damagemobj(self,target,dmg,"Bashing");
			if(hd_debug)A_Log(tracer.getclassname().." boinked for "..dmg.." damage with thrown "..getclassname());
		}

		vel*=frandom(0.7,0.8);
/*
		if(
			abs(vel.x)<3
			&&abs(vel.y)<3
			&&abs(vel.z)<3
		){
			bmissile=false;
			bBOUNCEONWALLS=false;
			bBOUNCEONFLOORS=false;
			bALLOWBOUNCEONACTORS=false;
			bBOUNCEAUTOOFF=false;
		}
*/
		A_StartSound("felonious/bolus",CHAN_BODY,CHANF_OVERLAP,min(1,dmg*0.02));
   A_AlertMonsters(1);
		setstatelabel("spawn");
	}

action void A_BolusTaunt(){
  A_StartSound("felonious/bolus",9);
  let ccp=new("DelayedTaunter");
		ccp.target=invoker;
		ccp.timer=18;}


	states{
	select0:
		FBOF A 0{
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
		FBOF A 0;
		---- AAA 1 A_Lower();
		---- A 1 A_Lower(18);
		---- A 1 A_Lower(24);
		---- A 1 A_Lower(30);
		wait;

	ready:
		FBOF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   FBOF A 0 A_BolusTaunt();

		FBOF BCCBA 2;
  goto nope;

//throw code borrowed from Potetobloke Weapons Pack,
//specifically the PS-451 single-use plasma gun
altreload:
  YEET:
  FBOF A 1;
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
		FBOL A -1;
		stop;
	
	}
}

