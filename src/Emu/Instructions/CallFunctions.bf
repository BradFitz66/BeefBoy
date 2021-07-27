namespace BeefBoy.Emu.Instructions
{
	public static class CallFunctions
	{
		public static void call_c_nn(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 1)
			{
				cpu.RAM.write_short_to_stack(cpu.registers.pc);
				cpu.registers.pc = param2;
				cpu.ticks += 24;
			}
			else
			{
				cpu.ticks += 12;
			}
		}

		public static void call_nc_nn(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 0)
			{
				cpu.RAM.write_short_to_stack(cpu.registers.pc);
				cpu.registers.pc = param2;
				cpu.ticks += 24;
			}
			else
			{
				cpu.ticks += 12;
			}
		}

		public static void call_nn(uint8 param, uint16 param2)
		{
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = param2;
		}

		public static void call_z_nn(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 1) == 1)
			{
				cpu.RAM.write_short_to_stack(cpu.registers.pc);
				cpu.registers.pc = param2;
				cpu.ticks += 24;
			}
			else
			{
				cpu.ticks += 12;
			}
		}

		public static void call_nz_nn(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 1) == 0)
			{
				cpu.RAM.write_short_to_stack(cpu.registers.pc);
				cpu.registers.pc = param2;
				cpu.ticks += 24;
			}
			else
			{
				cpu.ticks += 12;
			}
		}
	}
}
