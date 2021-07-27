using static System.Math;
namespace BeefBoy.Emu.Instructions
{
	public static class JumpFunctions
	{
		public static void jr_nz_n(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 0)
			{
				cpu.ticks+=12;
				Log("Zero bit is not set!\n");
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void jr_z_n(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 1)
			{
				cpu.ticks+=12;
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void jr_nc_n(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 0)
			{
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
			}
		}
		public static void jr_c_n(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 1)
			{
				cpu.ticks+=12;
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void jr_n(uint8 operand1, uint16 operand2)
		{
			cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
		}

		public static void jp_nz_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 1) == 0)
			{
				cpu.ticks+=12;
				cpu.registers.pc = operand2;
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void jp_nc_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 0)
			{
				cpu.ticks+=12;
				cpu.registers.pc = operand2;
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void jp_z_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 1)
			{
				cpu.ticks+=16;
				cpu.registers.pc = operand2;
			}
			else{
				cpu.ticks+=12;
			}
		}

		public static void jp_c_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 1)
			{
				cpu.ticks+=16;
				cpu.registers.pc = operand2;
			}
			else{
				cpu.ticks+=12;
			}
		}

		public static void jp_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.pc = cpu.registers.hl;
		}

		public static void jp_nn(uint8 operand1, uint16 operand2)
		{
			cpu.registers.pc = operand2;
		}

		public static void ret(uint8 param, uint16 param2)
		{
			cpu.registers.pc = cpu.RAM.read_short_from_stack();
		}

		public static void ret_z(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 1)
			{
				cpu.ticks+=20;
				cpu.registers.pc = cpu.RAM.read_short_from_stack();
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void ret_nz(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 0)
			{
				cpu.registers.pc = cpu.RAM.read_short_from_stack();
				cpu.ticks+=20;
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void ret_nc(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 0)
			{
				cpu.ticks+=20;
				cpu.registers.pc = cpu.RAM.read_short_from_stack();
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void ret_c(uint8 param, uint16 param2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 1)
			{
				cpu.ticks+=20;
				cpu.registers.pc = cpu.RAM.read_short_from_stack();
			}
			else{
				cpu.ticks+=8;
			}
		}

		public static void reti(uint8 param, uint16 param2)
		{
			cpu.registers.pc = cpu.RAM.read_short_from_stack();
		}
	}
}
