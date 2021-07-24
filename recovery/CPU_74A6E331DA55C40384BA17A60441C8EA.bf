using System;
namespace BeefBoy.Emu
{



//	struct Clock{
//		uint8
//	}

	struct Registers{
		public uint8 a;
		public uint8 b;
		public uint8 c;
		public uint8 d;
		public uint8 e;
		public uint8 h;
		public uint8 l;
		public uint8 flags;
		public uint16 sp;
		public uint16 pc;
	}


	class CPU
	{

		public Memory RAM ~ delete _;
		public Registers registers=.();

		public this(){
			RAM=new Memory();
		}

		
	}
}
