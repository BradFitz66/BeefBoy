namespace BeefBoy.Emu.Instructions
{
	public static class RstFunctions
	{
		public static void rst_30(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0030;
		}

		public static void rst_38(uint8 i = 0, uint16 i2 = 0)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0038;
		}

		public static void rst_28(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0028;
		}

		public static void rst_20(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0020;
		}

		public static void rst_18(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0018;
		}

		public static void rst_10(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0010;
		}

		public static void rst_08(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0008;
		}

		public static void rst_00(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x0000;
		}
	}
}
