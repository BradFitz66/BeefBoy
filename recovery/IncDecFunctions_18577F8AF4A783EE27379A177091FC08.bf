namespace BeefBoy.Emu.Instructions
{
	public static class IncDecFunctions
	{
		public static void dec_b(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.b);
		}

		public static void dec_bc(uint8 param, uint16 param2)
		{
			cpu.registers.bc--;
		}

		public static void dec_c(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.c);
		}

		public static void dec_d(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.d);
		}

		public static void dec_de(uint8 param, uint16 param2)
		{
			cpu.registers.de--;
		}

		public static void dec_e(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.e);
		}

		public static void dec_h(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.h);
		}

		public static void dec_hl(uint8 param, uint16 param2)
		{
			cpu.registers.hl--;
		}

		public static void dec_l(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.l);
		}

		public static void dec_a(uint8 param, uint16 param2)
		{
			Utils.dec(ref cpu.registers.a);
		}

		public static void dec_sp(uint8 param, uint16 param2)
		{
			cpu.registers.sp--;
		}




		public static void inc_b(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.b);
		}

		public static void inc_bc(uint8 param, uint16 param2)
		{
			cpu.registers.bc++;
		}

		public static void inc_c(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.c);
		}

		public static void inc_d(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.d);
		}

		public static void inc_de(uint8 param, uint16 param2)
		{
			cpu.registers.de++;
		}

		public static void inc_sp(uint8 param, uint16 param2)
		{
			cpu.registers.sp++;
		}

		public static void inc_e(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.e);
		}

		public static void inc_h(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.h);
		}

		public static void inc_hl(uint8 param, uint16 param2)
		{
			cpu.registers.hl++;
		}

		public static void inc_l(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.l);
		}

		public static void inc_a(uint8 param, uint16 param2)
		{
			Utils.inc(ref cpu.registers.a);
		}
	}
}
