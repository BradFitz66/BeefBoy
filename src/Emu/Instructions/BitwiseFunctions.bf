namespace BeefBoy.Emu.Instructions
{
	public static class BitwiseFunctions
	{
		public static void and_a(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.a;
		}
		public static void and_b(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.b;
		}
		public static void and_c(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.c;
		}
		public static void and_d(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.d;
		}
		public static void and_e(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.e;
		}
		public static void and_l(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.l;
		}
		public static void and_h(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.registers.h;
		}
		public static void and_hl(uint8 operand1,uint16 operand2){
			cpu.registers.a&=cpu.RAM[cpu.registers.hl];
		}
		public static void and_n(uint8 operand1,uint16 operand2){
			cpu.registers.a&=operand1;
		}



		public static void or_a(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.a;
		}
		public static void or_b(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.b;
		}
		public static void or_c(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.c;
		}
		public static void or_d(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.d;
		}
		public static void or_e(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.e;
		}
		public static void or_l(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.l;
		}
		public static void or_h(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.registers.h;
		}
		public static void or_hl(uint8 operand1,uint16 operand2){
			cpu.registers.a|=cpu.RAM[cpu.registers.hl];
		}
		public static void or_n(uint8 operand1,uint16 operand2){
			cpu.registers.a|=operand1;
		}

		
		public static void xor_a(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.a;
		}
		public static void xor_b(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.b;
		}
		public static void xor_c(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.c;
		}
		public static void xor_d(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.d;
		}
		public static void xor_e(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.e;
		}
		public static void xor_l(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.l;
		}
		public static void xor_h(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.registers.h;
		}
		public static void xor_hl(uint8 operand1,uint16 operand2){
			cpu.registers.a^=cpu.RAM[cpu.registers.hl];
		}
		public static void xor_n(uint8 operand1,uint16 operand2){
			cpu.registers.a^=operand1;
		}

		public static void rra(uint8 param, uint16 param2)
		{
			uint8 carry = ((Utils.getBit(cpu.registers.flags,4)==1) ? 1 : 0)<<7;
			uint8 c=0;
			if((cpu.registers.a & 0x01)==1)
				c=1;
			else
				c=0;

			cpu.registers.a>>=1;
			cpu.registers.a+=carry;

			Utils.setFlags(0,0,0,c);
		}

		public static void rla(uint8 param, uint16 param2)
		{
			uint8 carry = ((Utils.getBit(cpu.registers.flags,4)==1) ? 1 : 0)<<7;
			uint8 c=0;
			if((cpu.registers.a & 0x80)==1)
				c=1;
			else
				c=0;

			cpu.registers.a<<=1;
			cpu.registers.a+=carry;

			Utils.setFlags(0,0,0,c);
		}

		public static void rrca(uint8 param, uint16 param2)
		{
			uint8 carry = cpu.registers.a & 0x01;
			uint8 c=0;
			if((carry)==1)
				c=1;
			else
				c=0;

			cpu.registers.a>>=1;
			if(carry==1)cpu.registers.a|=0x80;

			Utils.setFlags(0,0,0,c);
		}

		public static void rlca(uint8 param, uint16 param2)
		{
			uint8 carry = (cpu.registers.a & 0x80)>>7;
			uint8 c=0;
			if((carry)==1)
				c=1;
			else
				c=0;

			cpu.registers.a>>=1;
			cpu.registers.a+=carry;

			Utils.setFlags(0,0,0,c);
		}
	}
}
