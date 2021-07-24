namespace BeefBoy.Emu.Instructions
{
	public static class DecFunctions
	{
		public static void dec_b(uint8 param, uint16 param2)
		{
			cpu.registers.b=Utils.dec(cpu.registers.b);
		}

		public static void dec_bc(uint8 param, uint16 param2)
		{
			cpu.registers.bc--;
		}

		public static void dec_c(uint8 param, uint16 param2)
		{
			cpu.registers.c=Utils.dec(cpu.registers.c);
		}

		public static void dec_d(uint8 param, uint16 param2)
		{
			cpu.registers.d=Utils.dec(cpu.registers.d);
		}

		public static void dec_de(uint8 param, uint16 param2)
		{
			cpu.registers.de--;
		}

		public static void dec_e(uint8 param, uint16 param2)
		{
			cpu.registers.e=Utils.dec(cpu.registers.e);
		}

		public static void dec_h(uint8 param, uint16 param2)
		{
			cpu.registers.h=Utils.dec(cpu.registers.h);
		}

		public static void dec_hl(uint8 param, uint16 param2)
		{
			cpu.registers.hl--;
		}


		public static void dec_l(uint8 param, uint16 param2)
		{
			cpu.registers.l=Utils.dec(cpu.registers.l);
		}

		public static void dec_a(uint8 param, uint16 param2)
		{
			cpu.registers.a=Utils.dec(cpu.registers.a);
		}
	}
}
