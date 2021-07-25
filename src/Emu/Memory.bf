using System;
namespace BeefBoy.Emu
{
	class Memory
	{
		uint8[65536] RAM;

		//different ram areas. Just useful for making sure we l
		public const uint16 boot_rom_begin = (uint16)0x00;
		public const uint16 boot_rom_end = (uint16)0xff;

		public const uint16 rom_bank_0_begin = (uint16)0x0000;
		public const uint16 rom_bank_0_end = (uint16)0x3fff;

		public const uint16 rom_bank_n_begin = (uint16)0x4000;
		public const uint16 rom_bank_n_end = (uint16)0x7fff;

		public const uint16 vram_begin = (uint16)0x8000;
		public const uint16 vram_end = (uint16)0x9fff;

		public const uint16 external_ram_begin = (uint16)0xa000;
		public const uint16 external_ram_end = (uint16)0xbfff;

		public const uint16 working_ram_begin = (uint16)0xc000;
		public const uint16 working_ram_end = (uint16)0xdfff;

		public const uint16 echo_ram_begin = (uint16)0xe000;
		public const uint16 echo_ram_end = (uint16)0xfdff;

		public const uint16 oam_begin = (uint16)0xfe00;
		public const uint16 oam_end = (uint16)0xfe9f;

		public const uint16 unused_begin = (uint16)0xfea0;
		public const uint16 unused_end = (uint16)0xfeff;

		public const uint16 io_registers_begin = (uint16)0xff00;
		public const uint16 io_registers_end = (uint16)0xff7f;

		public const uint16 zero_page_begin = (uint16)0xff80;
		public const uint16 zero_page_end = (uint16)0xfffe;



		public this()
		{
			RAM = .();
		}
		public ~this()
		{
		}

		//It isn't probably good practice to use an indexer in this context, but I think it's easier than writing
		// cpu.RAM.read_byte/cpu.RAM.write_byte over and over.
		public uint8 this[uint16 i]
		{
			get { return read_byte(uint16(i)); }
			set { write_byte(uint16(i), value); }
		}

		void write_byte(uint16 address, uint8 val)
		{
			//Log anything written to serial port address
			if (address == 0xFF01)
			{
				Log("\nWrote to serial port\n");
				SerialData.Append(scope $"{(char32)val}");
			}
			RAM[address] = val;
		}

		uint8 read_byte(uint16 address)
		{
			//ToDo: Remove this once GPU emulation is done. This stops the boot ROM from getting stuck.
			if (address == 0xFF44)
			{
				return 0x90;
			}
			return RAM[address];
		}

		public void load_ROM(uint8[] romData)
		{
			//Do not load bootrom currently. Will error.
			for (uint16 i = rom_bank_0_begin; i < (rom_bank_n_end - rom_bank_0_begin + 1); i++)
			{
				this[i] = romData[i];
			}
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

		public uint16 read_short(uint16 address)
		{
			return RAM[address] | ((uint16)RAM[address + 1] << 8);
		}

		public uint16 read_short_from_stack()
		{
			uint16 val = read_short(cpu.registers.sp);
			cpu.registers.sp += 2;


			return val;
		}

	}
}
