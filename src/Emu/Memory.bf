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

		//It isn't probably good practice to use an indexer in this context, but I think it's easier than writing cpu.RAM.read_byte/cpu.RAM.write_byte over and over.
		public uint8 this[uint16 i]
		{
			get { return read_byte(uint16(i)); }
			set { write_byte(uint16(i), value); }
		}

		void write_byte(uint16 address, uint8 val)
		{
			if(address==0xFF01){
				Log("\nWrote to serial port\n");
				SerialData.Append((char16)val);
			}
			RAM[address] = val;
		}

		uint8 read_byte(uint16 address)
		{
			return RAM[address];
		}

		public void dump_memory(bool useHex)
		{
			Log("----------RAM DUMP----------\n");
			for (let byte in RAM)
			{
				Log(scope $"0x"..AppendF("{0:X4}", (byte))..Append(" "));
			}
			Log("\n----------RAM DUMP----------\n");
		}

		public void write_short(uint16 address, uint16 value)
		{
			write_byte(address, (uint8)(value & 0x00ff));
			write_byte(address + 1, (uint8)((value & 0xff00) >> 8));
		}

		public void write_short_to_stack(uint16 value)
		{
			cpu.registers.sp -= 2;
			write_short(cpu.registers.sp, value);
		}

		public uint16 read_short(uint16 address){
			return RAM[address] | ((uint16)RAM[address+1]<<8);
		}

		public uint16 read_short_from_stack(){
			uint16 val=read_short(cpu.registers.sp);
			cpu.registers.sp+=2;


			return val;
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
