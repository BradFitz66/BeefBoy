using System;
namespace BeefBoy.Emu
{
	class Memory
	{
		uint8[65536] RAM;

		public this()
		{
			RAM = .();
		}
		public ~this()
		{
		}

		public uint8 this[int i]
		{
			get { return read_byte(uint16(i)); }
			set { write_byte(uint16(i), value); }
		}

		void write_byte(uint16 address, uint8 val)
		{
			RAM[address] = val;
		}

		uint8 read_byte(uint16 address)
		{
			return RAM[address];
		}

		public void dump_memory(bool useHex)
		{
			Console.WriteLine("----------RAM DUMP----------\n");
			for (let byte in RAM)
			{

				Console.Write(scope $"0x"..AppendF("{0:X4}",(byte))..Append(" "));

			}
			Console.WriteLine("\n----------RAM DUMP----------");
		}

		public void load_from_rom(uint8[] rom)
		{
			uint16 i = 0x0000;
			for (uint8 byte in rom)
			{
				write_byte(i, byte);

				i += 1;
			}
		}
	}
}
