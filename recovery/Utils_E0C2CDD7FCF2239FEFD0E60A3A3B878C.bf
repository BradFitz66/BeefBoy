using System;
namespace BeefBoy.Misc
{
	public static class Utils
	{
		public static void CreateLog(StringView data){

		}


		public static void SetBit(ref uint8 value, uint8 pos)
		{
			value = (1 << pos);
		}

		public static void SetBit(ref uint16 value, uint8 pos)
		{
			value = (1 << pos);
		}

		public static void ResetBit(ref uint8 value, uint8 pos)
		{
			value &= ~(1 << pos);
		}

		public static void ResetBit(ref uint16 value, uint8 pos)
		{
			value &= ~(1 << pos);
		}

		public static uint8 getBit(uint8 byte, uint8 position)
		{
			return (byte >> position) & 1;
		}

		public static uint16 getBit(uint16 byte, uint8 position)
		{
			return (byte >> position) & 1;
		}

		
		public static uint8 setFlags(uint16 value, uint16 new_value, bool overflow, uint8 sub, bool shouldCarry = true)
		{
			let registers = cpu.registers;
			let flags = cpu.registers.flags;

			uint8 zero = (new_value == 0 ? 1 : 0);
			uint8 subtract = sub;
			uint8 half_carry = (((cpu.registers.a & 0xF) + (value & 0xF) > 0xF) ? 1 : 0);
			uint8 carry = shouldCarry ? ((overflow ? 1 : 0)) : getBit(flags, 4);

			return zero << 7 | subtract << 6 | half_carry << 5 | carry << 4;
		}

		// // // // //Set flags directly with 4 values
		public static uint8 setFlags(uint8 z, uint8 s, uint8 hc, uint8 c)
		{
			return z << 7 | s << 6 | hc << 5 | c << 4;
		}

		// // // // //Set flags with an 8bit value, with some extra 'control' booleans
		public static uint8 setFlags(uint8 value, uint8 new_value, bool overflow, uint8 sub, bool shouldCarry = true)
		{
			let registers = cpu.registers;
			let flags = cpu.registers.flags;

			uint8 zero = (new_value == 0 ? 1 : 0);
			uint8 subtract = sub;
			uint8 half_carry = (((registers.a & 0xF) + (value & 0xF) > 0xF) ? 1 : 0);
			uint8 carry = shouldCarry ? ((overflow ? 1 : 0)) : getBit(flags, 4);

			return zero << 7 | subtract << 6 | half_carry << 5 | carry << 4;
		}
	}
}
