# BeefBoy
A windows gameboy emulator written in Beef


This was a project originally started early 2021, but university and just general burn-out shelved it for a while. I recently wrote 90% of the code since basically all of the code was essentially a port of a rust gameboy emulator rather than my own. However, this project still contains code from other emulators just as Cinoop in places where I was stumped. It also uses the same approach as Cinoop for 'decoding' instructions.

The structure and organization of the code may seem unusual, but it was mostly to deal with missing features inside Beef's IDE (code folding, multi-cursor support, etc). Instructions are segmented into their own classes (ex: all ld instructions are inside LoadFunctions.bf) for easier maintenance. 


# Building
First, download the repository and extract the folder to somewhere on your PC.
Next, you have to download the beef IDE at https://www.beeflang.org/ and then do File > Open Project and then choose the root folder of this project. Then, you build with F7.


# Usage
Currently there's only basic CPU emulation, but this will expand to include GPU and hopefully audio emulation as-well. For now, to run the emulator you have to use the command line. To do this, you must build the project and then in the command line navigate to BeefBoyRewrite/build/Debug_Win64/BeefBoy. To run a rom (keep in mind, this is still only CPU emulation), run the command:

beefboy loadrom -d -p PATH_TO_ROM

while inside the beefboy build folder (the one with the .exe inside). At the moment, it will continuosly log instructions ran by the CPU to a log file. Do not leave it running for to long (press esc to exit) otherwise you risk filling up your storage. 
