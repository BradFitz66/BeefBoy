namespace BeefBoy.Emu.Instructions
{
	public static class SubFunctions
	{
		public static void sub_b(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.b);
		}
		public static void sub_c(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.c);
		}
		public static void sub_d(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.d);
		}
		public static void sub_e(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.e);
		}
		public static void sub_h(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.h);
		}
		public static void sub_l(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.l);
		}

		public static void sub_a(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.registers.a);
		}

		public static void sub_hl(uint8 operand1,uint16 operand2)
		{
			Utils.sub(cpu.RAM[cpu.registers.hl]);
		}

		public static void sub_n(uint8 param, uint16 param2)
		{
			Utils.sub(param);
		}
	}
}
