//-------------------------------------------------
// *squeako*
//-------------------------------------------------
class TransCacoPlushDoll:HDWeapon{
	default{
		-hdweapon.droptranslation
   weapon.slotnumber 7;
		weapon.slotpriority 9;
		inventory.pickupmessage "Picked up a cacodemon plushie. Trans Rights!";
		inventory.icon "TCPLA0";
  bouncefactor 2.;
		scale 1;
		tag "Trans Cacodemon Plushie";
		hdweapon.refid "tcp";
	}

override string,double getpickupsprite(bool usespare){
		return "TCPLA0",1.;
	}

override double weaponbulk(){
		return 20;
	}

override string gethelptext(){
		return
		WEPHELP_FIRE.."  Squeeze plushie\n"
  ..WEPHELP_ALTRELOAD.."  Throw\n";
	}

//these functions MUST be added to new HDWeapons
//to support proper weapon stacking
override bool AddSpareWeapon(actor newowner){
  return AddSpareWeaponRegular(newowner);
  }
override hdweapon GetSpareWeapon(actor newowner, bool reverse, bool doselect){
  return GetSpareWeaponRegular(newowner,reverse,doselect);
  }

override void GunBounce(){
		double wb=weaponbulk();
		int dmg=int(throwvel*wb*wb*frandom(0.00001,0.0001));

		if(tracer){
			tracer.damagemobj(self,target,dmg,"Bashing");
			if(hd_debug)A_Log(tracer.getclassname().." hit for "..dmg.." damage with thrown "..getclassname());
		}

		vel*=frandom(0.7,0.8);
		if(
			abs(vel.x)<5
			&&abs(vel.y)<5
			&&abs(vel.z)<5
		){
			bmissile=false;
			bBOUNCEONWALLS=false;
			bBOUNCEONFLOORS=false;
			bALLOWBOUNCEONACTORS=false;
			bBOUNCEAUTOOFF=false;
		}

		A_StartSound("plush/squeak",CHAN_BODY,CHANF_OVERLAP,min(0.7,dmg*0.02));
		setstatelabel("spawn");
	}

	states{
	select0:
		TCPF A 0{
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
		TCPF A 0;
		---- AAA 1 A_Lower();
		---- A 1 A_Lower(18);
		---- A 1 A_Lower(24);
		---- A 1 A_Lower(30);
		wait;

	ready:
		TCPF A 0;
		#### A 1 A_WeaponReady(WRF_ALL);
		goto readyend;

  fire:
   TCPF A 0 A_StartSound("plush/squeak",9);
		TCPF ABCCBA 2;
  goto nope;

//throw code borrowed from Potetobloke Weapons Pack,
//specifically the PS-451 single-use plasma gun
altreload:
  YEET:
  TCPF A 1;
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
		TCPL A -1;
		stop;
	
	}
}

