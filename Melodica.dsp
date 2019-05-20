//Code by Eric S. Niebergal
//A melodica for Android mobile devices
declare interface "SmartKeyboard{
    'Number of Keyboards':'2',
    'Keyboard 0 - Number of Keys':'13',
    'Keyboard 1 - Number of Keys':'13',
    'Keyboard 0 - Lowest Key':'72',
    'Keyboard 1 - Lowest Key':'60'
}";

import("stdfaust.lib");

f = nentry("freq",200,40,2000,0.01);
g = nentry("gain",1,0,1,0.01);
t = button("gate");
y = an.amp_follower_ar(0.02, 0.02); 

gain = y;
envelope = t*gain : si.smoo;
process = os.sawtooth(f)*envelope <: _,_ ;
			