namespace BeefBoy.Emu.Instructions
{
	public static class SbcFunctions
	{
		
		public static void sbc_b(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.registers.b);
		}
		public static void sbc_c(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.registers.c);
		}
		public static void sbc_d(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.registers.d);
		}
		public static void sbc_e(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.registers.e);
		}
		public static void sbc_h(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.registers.h);
		}
		public static void sbc_l(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.registers.l);
		}

		public static void sbc_a(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.RAM[cpu.registers.hl]);
		}

		public static void sbc_hl(uint8 operand1,uint16 operand2)
		{
			Utils.sbc(cpu.RAM[cpu.registers.hl]);
		}

		public static void sbc_n(uint8 param, uint16 param2)
		{
			Utils.sbc(cpu.RAM[param]);
		}
	}
}
