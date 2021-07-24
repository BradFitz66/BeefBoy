using static System.Math;
namespace BeefBoy.Emu.Instructions
{
	public static class JumpFunctions
	{

		public static void jr_nz_n(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 0)
			{
				Log("Zero bit is not set!\n");
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
			}
		}

		public static void jr_z_n(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 1)
			{
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
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
				cpu.registers.pc = (uint16)((int16)cpu.registers.pc + (int8)operand1);
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
				cpu.registers.pc = operand2;
			}
		}

		public static void jp_nc_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 0)
			{
				cpu.registers.pc = operand2;
			}
		}

		public static void jp_z_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 7) == 1)
			{
				cpu.registers.pc = operand2;
			}
		}

		public static void jp_c_nn(uint8 operand1, uint16 operand2)
		{
			if (Utils.getBit(cpu.registers.flags, 4) == 1)
			{
				cpu.registers.pc = operand2;
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
	}
}
