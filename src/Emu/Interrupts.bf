namespace BeefBoy.Emu
{
	struct interrupt
	{
		public uint8 master;
		public uint8 enable;
		public uint8 flags;
	}

	public class Interrupts
	{
		public interrupt curInterrupt;
		const uint8 INTERRUPTS_VBLANK = 1 << 0;
		const uint8 INTERRUPTS_LCDSTAT = 1 << 1;
		const uint8 INTERRUPTS_TIMER = 1 << 2;
		const uint8 INTERRUPTS_SERIAL = 1 << 3;
		const uint8 INTERRUPTS_JOYPAD = 1 << 4;
		void step()
		{
			if (curInterrupt.master == 1 && curInterrupt.enable == 1 && curInterrupt.flags == 1)
			{
				uint8 fire = curInterrupt.enable & curInterrupt.flags;

				if (fire & INTERRUPTS_VBLANK == 1)
				{
					curInterrupt.flags &= ~INTERRUPTS_VBLANK;
					vblank();
				}

				if (fire & INTERRUPTS_LCDSTAT == 1)
				{
					curInterrupt.flags &= ~INTERRUPTS_LCDSTAT;
					lcdStat();
				}

				if (fire & INTERRUPTS_TIMER == 1)
				{
					curInterrupt.flags &= ~INTERRUPTS_TIMER;
					timer();
				}

				if (fire & INTERRUPTS_SERIAL == 1)
				{
					curInterrupt.flags &= ~INTERRUPTS_SERIAL;
					serial();
				}

				if (fire & INTERRUPTS_JOYPAD == 1)
				{
					curInterrupt.flags &= ~INTERRUPTS_JOYPAD;
					joypad();
				}
			}
		}
		void vblank()
		{
			//drawFramebuffer();
			curInterrupt.master=0;
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc=0x40;

			cpu.ticks+=12;
		};
		void lcdStat(){
			curInterrupt.master = 0;
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x48;
			
			cpu.ticks += 12;
		}

		void timer() {
			curInterrupt.master = 0;
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x50;
			
			cpu.ticks += 12;
		}

		void serial() {
			curInterrupt.master = 0;
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x58;
			
			cpu.ticks += 12;
		}

		void joypad() {
			curInterrupt.master = 0;
			cpu.RAM.write_short_to_stack(cpu.registers.pc);
			cpu.registers.pc = 0x60;
			
			cpu.ticks += 12;
		}

		void returnFromInterrupt() {
			curInterrupt.master = 1;
			cpu.registers.pc = cpu.RAM.read_short_from_stack();
		}
	}
}
