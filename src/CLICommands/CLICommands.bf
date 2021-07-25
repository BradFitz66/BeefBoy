using CowieCLI;
using System;
using System.Collections;
namespace BeefBoy.CLICommands
{
	/*
	Author: Badfitz66/DucktorCid
	Description: A bunch of classes for command line arguments for the emulator
	*/

	[Reflect, AlwaysInclude(AssumeInstantiated=true, IncludeAllMethods=true)]
	public class TestCPU : ICommand{

		private CommandInfo mInfo=new CommandInfo().Name("TestCPU").About("Test the CPU OPCodes") ~ delete _;
		public override CommandInfo Info => mInfo;

		public override int Execute()
		{
			Console.WriteLine(scope $"Command {Info.Name} has been executed successfully!");
			return default;
		}
	}

	[Reflect, AlwaysInclude(AssumeInstantiated=true, IncludeAllMethods=true)]
	public class LoadROM : ICommand{

		private CommandInfo mInfo=new CommandInfo()
			.Name("LoadROM")
			.About("Load a rom")
			.Option(new CommandOption("path","path to the ROM")
				.Short("p"))
			 .Option(new CommandOption("debug","Create a log from the contents of RAM after command is complete")
				.Optional()
				.Flag()
				.Short("d")
			) ~ delete _;

		public override CommandInfo Info => mInfo;

		public String Path {get; set;}
		public bool Debug;


		public ~this(){

		}

		public override int Execute()
		{
			Console.WriteLine(scope $"Loading ROM from {Path}. Press ESC to stop.");
			loadROM(@"c:\Beef\BeefBoyRewrite\src\Data\dmg_boot.bin");
			loadROM(Path);

			if(Debug){
				cpu.RAM.dump_memory(true);
			}
			return default;
		}
	}
}
