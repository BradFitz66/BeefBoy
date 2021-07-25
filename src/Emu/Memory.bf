using System;
namespace BeefBoy.Emu
{
	class Memory
	{

		//different ram areas. Just useful for making sure we l
		public const uint16 BOOT_ROM_BEGIN = (uint16)0X00;
		public const uint16 BOOT_ROM_END = (uint16)0XFF;
		public const uint16 BOOT_ROM_SIZE = BOOT_ROM_END - BOOT_ROM_BEGIN + 1;

		public const uint16 ROM_BANK_0_BEGIN = (uint16)0X0000;
		public const uint16 ROM_BANK_0_END = (uint16)0X3FFF;
		public const uint16 ROM_BANK_0_SIZE = ROM_BANK_0_END - ROM_BANK_0_BEGIN + 1;

		public const uint16 ROM_BANK_N_BEGIN = (uint16)0X4000;
		public const uint16 ROM_BANK_N_END = (uint16)0X7FFF;
		public const uint16 ROM_BANK_N_SIZE = ROM_BANK_N_END - ROM_BANK_N_BEGIN + 1;

		public const uint16 VRAM_BEGIN = (uint16)0X8000;
		public const uint16 VRAM_END = (uint16)0X9FFF;
		public const uint16 VRAM_SIZE = VRAM_END - VRAM_BEGIN + 1;

		public const uint16 EXTERNAL_RAM_BEGIN = (uint16)0XA000;
		public const uint16 EXTERNAL_RAM_END = (uint16)0XBFFF;
		public const uint16 EXTERNAL_RAM_SIZE = EXTERNAL_RAM_END - EXTERNAL_RAM_BEGIN + 1;

		public const uint16 WORKING_RAM_BEGIN = (uint16)0XC000;
		public const uint16 WORKING_RAM_END = (uint16)0XDFFF;
		public const uint16 WORKING_RAM_SIZE = WORKING_RAM_END - WORKING_RAM_BEGIN + 1;

		public const uint16 ECHO_RAM_BEGIN = (uint16)0XE000;
		public const uint16 ECHO_RAM_END = (uint16)0XFDFF;
		public const uint16 ECHO_RAM_SIZE = ECHO_RAM_END - ECHO_RAM_BEGIN + 1;

		public const uint16 OAM_BEGIN = (uint16)0XFE00;
		public const uint16 OAM_END = 0XFE9F;
		public const uint16 OAM_SIZE = OAM_END - OAM_BEGIN + 1;

		public const uint16 UNUSED_BEGIN = (uint16)0XFEA0;
		public const uint16 UNUSED_END = (uint16)0XFEFF;
		public const uint16 UNUSED_SIZE = UNUSED_END - UNUSED_BEGIN + 1;

		public const uint16 IO_REGISTERS_BEGIN = (uint16)0XFF00;
		public const uint16 IO_REGISTERS_END = (uint16)0XFF7F;
		public const uint16 IO_REGISTERS_SIZE = IO_REGISTERS_END - IO_REGISTERS_BEGIN + 1;

		public const uint16 ZERO_PAGE_BEGIN = (uint16)0XFF80;
		public const uint16 ZERO_PAGE_END = (uint16)0XFFFE;
		public const uint16 ZERO_PAGE_SIZE = ZERO_PAGE_END - ZERO_PAGE_BEGIN + 1;

		uint8[BOOT_ROM_SIZE] bootROM;
		uint8[ROM_BANK_0_SIZE] ROMbank0;
		uint8[ROM_BANK_N_SIZE] ROMbankN;
		uint8[VRAM_SIZE] VRAM;
		uint8[EXTERNAL_RAM_SIZE] externalRAM;
		uint8[WORKING_RAM_SIZE] workingRAM;
		uint8[ECHO_RAM_SIZE] echoRAM;
		uint8[OAM_SIZE] OAM;
		uint8[UNUSED_SIZE] unused;
		uint8[IO_REGISTERS_SIZE] IOregisters;
		uint8[ZERO_PAGE_SIZE] zeropage;


		public this()
		{
			
			ROMbank0 = .();
			ROMbankN = .();
			VRAM = .();
			externalRAM = .();
			workingRAM = .();
			echoRAM = .();
			OAM = .();
			unused = .();
			IOregisters = .();
			zeropage = .();
			
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

		uint8 read_ram_area(uint16 address)
		{
			switch (address) {

			case when address >= ROM_BANK_0_BEGIN && address <= ROM_BANK_0_END:
				return ROMbank0[address];

			case when address >= ROM_BANK_N_BEGIN && address <= ROM_BANK_N_END:
				return ROMbankN[address - ROM_BANK_N_BEGIN];

			case when address >= VRAM_BEGIN && address <= VRAM_END:
				return VRAM[address - VRAM_BEGIN];

			case when address >= EXTERNAL_RAM_BEGIN && address <= EXTERNAL_RAM_END:
				return externalRAM[address - EXTERNAL_RAM_BEGIN];

			case when address >= WORKING_RAM_BEGIN && address <= WORKING_RAM_END:
				return workingRAM[address - WORKING_RAM_BEGIN];

			case when address >= ECHO_RAM_BEGIN && address <= ECHO_RAM_END:
				return workingRAM[address - ECHO_RAM_BEGIN];

			case when address >= OAM_BEGIN && address <= OAM_END:
				return OAM[address - OAM_BEGIN];//ToDo: GPU emu

			case when address >= UNUSED_BEGIN && address <= UNUSED_END:
				return 0;

			case when address >= IO_REGISTERS_BEGIN && address <= IO_REGISTERS_END:
				return IOregisters[address - IO_REGISTERS_BEGIN];

			case when address >= ZERO_PAGE_BEGIN && address <= ZERO_PAGE_END:
				return zeropage[address - ZERO_PAGE_BEGIN];

			case 0xFFFF:
				return 0;

			default:
				Internal.FatalError(scope $"Can't find address 0x{address:x4}");
			}
		}

		void write_ram_area(uint16 address, uint8 val)
		{
			switch (address) {
			case when address >= ROM_BANK_0_BEGIN && address <= ROM_BANK_0_END:
				ROMbank0[address] = val;

			case when address >= ROM_BANK_N_BEGIN && address <= ROM_BANK_0_END:
				ROMbankN[address - ROM_BANK_N_BEGIN] = val;

			case when address >= VRAM_BEGIN && address <= VRAM_END:
				VRAM[address - VRAM_BEGIN] = val;

			case when address >= EXTERNAL_RAM_BEGIN && address <= EXTERNAL_RAM_END:
				externalRAM[address - EXTERNAL_RAM_BEGIN] = val;

			case when address >= WORKING_RAM_BEGIN && address <= WORKING_RAM_END:
				workingRAM[address - WORKING_RAM_BEGIN] = val;

			case when address >= ECHO_RAM_BEGIN && address <= ECHO_RAM_END:
				workingRAM[address - ECHO_RAM_BEGIN] = val;

			case when address >= OAM_BEGIN && address <= OAM_END:
				OAM[address - OAM_BEGIN] = val;//ToDo: GPU emu

			case when address >= UNUSED_BEGIN && address <= UNUSED_END:
				break;

			case when address >= IO_REGISTERS_BEGIN && address <= IO_REGISTERS_END:
				IOregisters[address - IO_REGISTERS_BEGIN] = val;

			case when address >= ZERO_PAGE_BEGIN && address <= ZERO_PAGE_END:
				zeropage[address - IO_REGISTERS_BEGIN] = val;

			case 0xFFFF:
				//Interrupt stuff.
			}
		}

		void write_byte(uint16 address, uint8 val)
		{



			//Log anything written to serial port address
			if (address == 0xFF01)
			{
				Log("\nWrote to serial port\n");
				SerialData.Append(scope $"{(char32)val}");
			}
			write_ram_area(address, val);
		}

		uint8 read_byte(uint16 address)
		{
			//ToDo: Remove this once GPU emulation is done. This stops the boot ROM from getting stuck.
			if (address == 0xFF44)
			{
				return 0x90;
			}
			return read_ram_area(address);
		}

		public void load_ROM(uint8[] romData)
		{
			Console.WriteLine(romData.Count);
			//Do not load bootrom currently. Will error.
			for (uint16 i = ROM_BANK_0_BEGIN; i < ROM_BANK_N_END; i++)
			{
				this[i] = romData[i];
			}
		}

		public void dump_memory(bool useHex)
		{

			Log("----------RAM DUMP----------\n");
			//Boot ROM and ROM BANK 0 overlap. Show where the boot ROM would be anyway.
			Log("\n ROM BANK 0 \n");
			Log("\n BOOT ROM start\n ");
			int ind=0;
			for (let byte in ROMbank0)
			{

				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
				if(ind==257)
					Log("\n BOOT ROM end \n");
				ind++;
			}
			Log("\n ROM BANK N \n");
			for (let byte in ROMbankN)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n VRAM \n");
			for (let byte in VRAM)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n EXTERNAL RAM \n");
			for (let byte in externalRAM)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n WORKING RAM \n");
			for (let byte in workingRAM)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n ECHO RAM \n");
			for (let byte in echoRAM)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n OAM \n");
			for (let byte in OAM)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n UNUSED \n");
			for (let byte in unused)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n IO REGISTERS \n");
			for (let byte in IOregisters)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
			}
			Log("\n ZERO PAGE \n");
			for (let byte in zeropage)
			{
				Log(scope $"0x"..AppendF("{0:X2}", (byte))..Append(" "));
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
			return this[address] | ((uint16)this[address + 1] << 8);
		}

		public uint16 read_short_from_stack()
		{
			uint16 val = read_short(cpu.registers.sp);
			cpu.registers.sp += 2;


			return val;
		}

	}
}
