namespace BeefBoy.Emu.Instructions
{
	public static class StackFunctions
	{
		public static void push_bc(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.bc);
		}
		public static void push_de(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.de);
		}
		public static void push_hl(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.hl);
		}
		public static void push_af(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.af);
		}

		public static void pop_bc(uint8 param, uint16 param2)
		{
			cpu.registers.bc = cpu.RAM.read_short_from_stack();
		}

		public static void pop_de(uint8 param, uint16 param2)
		{
			cpu.registers.bc = cpu.RAM.read_short_from_stack();
		}

		public static void pop_hl(uint8 param, uint16 param2)
		{
			cpu.registers.bc = cpu.RAM.read_short_from_stack();
		}

		public static void pop_af(uint8 param, uint16 param2)
		{
			cpu.registers.bc = cpu.RAM.read_short_from_stack();
		}
	}
}
