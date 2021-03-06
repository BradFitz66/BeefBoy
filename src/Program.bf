using System;
using System.IO;
using BeefBoy.CLICommands;
using CowieCLI;
using BeefBoy.Emu;
using Atma;
namespace BeefBoy
{
	/*
	Author: Ducktor Cid/Badfitz66/Garf (sorry I have a lot of usernames)
	Description: A basic GameBoy emulator written in beef.


	This is mostly a project I did to get more familiar with low-level stuff. I figured an emulator would be a good way.

	The code in this project isn't great, possibly not even good. Probably got a lot of bad practices going on (overuse of globals, abuse of stuff like indexers for syntax sugar).

	There's also some decisions some may find confusing, such as instructions being in separate classes. This is mostly due to the fact that beef doesn't support any form of
	code folding which makes it a pain in the ass to keep stuff organized and clean. I've tried to comment as much as I can, but their helpfulness may be limited.

	A lot of this was only possible due to the great guides at https://cturt.github.io/cinoop.html and other places. Some of their source code was also used to help me understand how to
	implement some instructions and how to structure my code.
	*/


	static
	{
		public static int amountOfLogs=0;
		public static String debugLog = new $"" ~ delete _;

		public static void Log(String data)
		{
			amountOfLogs++;
			debugLog.Append(data);
			if(amountOfLogs>=16){
				Result<void> result = WriteAllBytes(@"C:\Beef\BeefBoyRewrite\Logs\Log.txt", debugLog,true);
				debugLog.Clear();
			}
		}

		public static String SerialData=new $"" ~ delete _;

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

		public static Result<void> WriteAllBytes(StringView path, Span<char8> data, bool doAppend = false)
		{
			FileStream fs = scope FileStream();
			var result = fs.Open(path, doAppend ? .Append : .Create, .Write);
			if (result case .Err)
				return .Err;
			fs.TryWrite(.((uint8*)data.Ptr, data.Length));
			return .Ok;
		}

		public static void loadROM(String ROMPath,bool isBootROM=false)
		{
			uint8[] rom;
			Result<uint8[]> ROMData = ReadAllBytes((ROMPath));
			rom = ROMData.Value;
			if (rom.Count == 0){
				Console.WriteLine("ROM is empty!"); 
				return;
			}

			cpu.RAM.load_ROM(rom,isBootROM);
			delete (ROMData.Value);
		}
		public static BeefBoy.Display display;
		public static PPU ppu;
	}
	class Program
	{

		public static int Main(String[] args)
		{
			//Use scope. This will unallocate these when they out of scope which will only happen once the program exits.
			display=scope BeefBoy.Display("BeefBoy",160*6,144*6,.None);

			ppu=scope PPU();
			cpu = scope CPU();
			loadROM(@"C:\Beef\BeefBoyRewrite\src\Data\dmg_boot.bin",true);
			

			//Setup command line instructions.
			/*CowieCLI CLI = scope CowieCLI("BeefBoy", "Emulator for the GB written in beef!");
			CLI.RegisterCommand<TestCPU>("testcpu");
			CLI.RegisterCommand<LoadROM>("loadrom");
			CLI.Run(args);*/

			//Clear log
			WriteAllBytes(@"C:\Beef\BeefBoyRewrite\Logs\Log.txt", " ",false);
			//Dump RAM at start
			WriteAllBytes(@"C:\Beef\BeefBoyRewrite\Logs\Log.txt", " ",false);
			display.Run();
			return 0;
		}
		[Import("user32.dll"),CLink,StdCall]
		static extern int16 GetAsyncKeyState(int vKey);

		public static bool IsKeyPushedDown(int vKey){
			return (0!=GetAsyncKeyState(vKey));
		}
	}
}