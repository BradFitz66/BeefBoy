using System;
using BeefBoy;


/*
Utility class. Mostly just functions to help with setting flags and also generic functions for some instructions like add, dec, etc.
*/
public static class Utils
{

	public static void bit(uint8 pos, uint8 register){
		uint8 z,n,hc,c=0;
		z=getBit(register,pos)==0 ? 1 : 0;
		hc=1;
		c=getBit(cpu.registers.flags,4);
		n=0;

		setFlags(z,n,hc,c);
	}

	public static void cp(uint8 value){
		uint8 z,n,hc,c;
		z=0;
		n=0;
		hc=0;
		c=0;
		if(cpu.registers.a == value)z=1;

		if(value>cpu.registers.a)c=1;

		if(value & 0x0f>cpu.registers.a & 0x0f)hc=1;

		n=1;

		setFlags(z,n,hc,c);
	}

	public static void bit(uint8 pos, uint16 register){
		uint8 z,n,hc,c=0;
		z=getBit(register,pos)==0 ? 1 : 0;
		hc=1;
		c=getBit(cpu.registers.flags,4);
		n=0;

		setFlags(z,n,hc,c);
	}

	enum RotateDirection{left,right}
	public static void rotate_register(RotateDirection dir,ref uint8 register,uint8 amount){
		uint8 z,n,hc,c=0;
		n=0;
		hc=0;
		if(dir==.left){
			c=(register & 0x80)>0 ? 1 : 0;
			register<<=1;
			z=register==0 ? 1 : 0;
		}
		else{
			if((register & 0x01)>0){
				register|=0x80;
				c=1;
			}
			register>>=1;
			z=register==0 ? 1 : 0;
		}
		setFlags(z,n,hc,c);
	}


	//Add two registers together
	public static void add(ref uint8 destination, uint8 value)
	{
		uint8 result = destination + value;
		uint8 z, n, hc, c = 0;

		z = result > 0 ? 0 : 1;
		n = 0;
		hc = ((result & 0x0F) + (value & 0x0F)) > 0xF ? 1 : 0;
		c = uint8(result & 0xff00) > 0 ? 1 : 0;

		setFlags(z, n, hc, c);
	}

	public static void add(ref uint16 destination, uint16 value){
		uint16 result = destination+value;
		uint8 z,n,hc,c;
		z=getBit(cpu.registers.flags,7);
		n=0;
		hc=0;
		c=0;
		if(result & 0xffff0000==1){
			c=1;
		}

		destination=(result & 0xffff);
		if(((destination&0x0f)+(value&0x0f))>0x0f)
			hc=1;

		setFlags(z,n,hc,c);
	}

	public static void dec(ref uint8 register){
		register--;


		uint8 z,n,hc,c=0;

		z = register > 0 ? 0 : 1;
		n = 1;
		hc = (register & 0x0F)>0 ? 0 : 1;
		c=getBit(cpu.registers.flags,4);
		setFlags(z,n,hc,c);
	}

	public static void inc(ref uint8 register){

		register++;
		uint8 z,n,hc,c=0;

		z = register > 0 ? 0 : 1;
		n = 0;
		hc = (register & 0x0F)>0 ? 0 : 1;
		c=getBit(cpu.registers.flags,4);
		setFlags(z,n,hc,c);
	}

	//Add with carry
	public static void adc(uint8 value)
	{
		uint8 val = value + getBit(cpu.registers.flags, 4);
		uint8 result = cpu.registers.a + val;
		uint8 z, n, hc, c = 0;

		z = val == cpu.registers.a ? 1 : 0;
		n = 0;
		hc = ((result & 0x0F) + (cpu.registers.a & 0x0F)) > 0xF ? 1 : 0;
		c = uint8(result & 0xff00) > 0 ? 1 : 0;

		setFlags(z, n, hc, c);
	}

	//Subtract w/ carry
	public static void sbc(uint8 value)
	{
		uint8 val = value + getBit(cpu.registers.flags, 4);
		uint8 result = cpu.registers.a + val;
		uint8 z, n, hc, c = 0;

		z = val == cpu.registers.a ? 1 : 0;
		n = 1;
		hc = ((result & 0x0F) > (cpu.registers.a & 0x0F)) ? 1 : 0;
		c = uint8(result & 0xff00) > 0 ? 1 : 0;

		setFlags(z, n, hc, c);
		cpu.registers.a -= val;
	}
	//Subtract
	public static void sub(uint8 value)
	{
		uint8 z, n, hc, c = 0;

		z = cpu.registers.a > 0 ? 0 : 1;
		n = 1;
		hc = ((value & 0x0F) > (cpu.registers.a & 0x0F)) ? 1 : 0;
		c = value > cpu.registers.a ? 1 : 0;

		cpu.registers.a -= value;
		setFlags(z, n, hc, c);
	}

	//Set a specific bit in a number.
	public static void SetBit(ref uint8 value, uint8 pos)
	{
		value = (1 << pos);
	}

	public static void SetBit(ref uint16 value, uint8 pos)
	{
		value = (1 << pos);
	}

	//Reset a specific bit in a number.
	public static void ResetBit(ref uint8 value, uint8 pos)
	{
		value &= ~(1 << pos);
	}

	public static void ResetBit(ref uint16 value, uint8 pos)
	{
		value &= ~(1 << pos);
	}

	//Get a specific bit in a number.
	public static uint8 getBit(uint8 byte, uint8 position)
	{
		return (byte >> position) & 1;
	}

	public static uint16 getBit(uint16 byte, uint8 position)
	{
		return (byte >> position) & 1;
	}

	//Set flags directly with 4 values
	public static void setFlags(uint8 z, uint8 s, uint8 hc, uint8 c)
	{
		cpu.registers.flags = z << 7 | s << 6 | hc << 5 | c << 4;
	}


	enum flagTarget{z,s,hc,c};
	//Set flags directly with 4 values
	public static void setFlags(flagTarget target, bool value)
	{
		uint8 flagPos=0;
		switch(target){
		case .c:
			flagPos=4;
		case .hc:
			flagPos=5;
		case .s:
			flagPos=6;
		case .z:
			flagPos=7;
		}

		if(value)
			SetBit(ref cpu.registers.flags,flagPos);
		else
			ResetBit(ref cpu.registers.flags,flagPos);
	}
}

