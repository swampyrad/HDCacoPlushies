//-------------------------------------------------
//Trans rights are human rights, the same way guns are weapons.
//If you're having trouble with this, one stopgap measure is to think
//of this in the same way guns are loaded.
//-------------------------------------------------
class TransPrideCacoPlushDoll:CacoPlushDoll{
	default{
		inventory.pickupmessage "Picked up a trans pride cacodemon plushie. Trans Rights!";
		inventory.icon "TCPLA0";
		tag "Trans Pride Cacodemon Plushie";
		hdweapon.refid "tcp";
	}

override string,double getpickupsprite(bool usespare){
		return "TCPLA0",1.;
	}

	states{
	select:
		TCPF A 0;
		goto selectcaco;

	spawn:
		TCPL A -1;
		stop;
	
	}
}

