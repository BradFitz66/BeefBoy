namespace BeefBoy.Emu.Instructions
{
	public static class AddFunctions
	{
		public static void add_a_a(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.a);
		}
		public static void add_a_b(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.b);
		}
		public static void add_a_c(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.c);
		}
		public static void add_a_d(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.d);
		}
		public static void add_a_e(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.e);
		}
		public static void add_a_h(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.h);
		}
		public static void add_a_l(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.registers.l);
		}
		public static void add_a_hl(uint8 operand1,uint16 operand2)
		{
			Utils.add(ref cpu.registers.a, cpu.RAM[cpu.registers.hl]);
		}

		public static void add_a_n(uint8 param, uint16 param2)
		{

		}

		public static void add_sp_n(uint8 param, uint16 param2)
		{

		}

		public static void add_hl_sp(uint8 param, uint16 param2)
		{

		}

		public static void add_hl_hl(uint8 param, uint16 param2)
		{

		}

		public static void add_hl_de(uint8 param, uint16 param2)
		{

		}

		public static void add_hl_bc(uint8 param, uint16 param2)
		{

		}
	}
}