using System;
using System.IO;
using BeefBoy.CLICommands;
using CowieCLI;
using BeefBoy.Emu;
namespace BeefBoy
{
	static
	{
		public static CPU cpu;
		public static Result<uint8[]> ReadAllBytes(StringView path)
		{
			FileStream fs = scope FileStream();
			var result = fs.Open(path, .Read, .Read);

			if (result case .Err)
				return .Err;
			int length = fs.Length;
			uint8[] data = new uint8[length];
			fs.TryRead(.(data));

			return .Ok(data);
		}

		public static void loadROM(String ROMName)
		{

			//bus.bootROM=.();
			uint8[] rom;
			Result<uint8[]> ROMData = ReadAllBytes((@"C:\Beef\BeefBoy\src\Data\cpu_instrs.gb"));
			rom = ROMData.Value;
			if (rom.Count == 0)
				return;

			for (uint16 i = 0x000; i < 0x3FFF; i++)
			{
				//It's probably bad practice to use an indexer for this, but I find it a bit 'cleaner' than a bunch of
				// function calls (ex: cpu.RAM.write_byte(address,RAM)) over and over again.
				cpu.RAM[i] = rom[i];
			}
			delete (ROMData.Value);
		}
	}
	class Program
	{

		public static int Main(String[] args)
		{
			cpu = scope CPU();

			CowieCLI CLI = scope CowieCLI("BeefBoy", "Emulator for the GB written in beef!");
			CLI.RegisterCommand<TestCPU>("testcpu");
			CLI.RegisterCommand<LoadROM>("loadrom");
			CLI.Run(args);

			Console.Read();
			return 0;
		}


	}
}