using Atma;
namespace BeefBoy.Emu
{
	struct options
	{
		public uint8 priority = 1;
		public uint8 vFlip = 1;
		public uint8 hFlip = 1;
		public uint8 palette = 1;
	}
	struct Sprite
	{
		public uint8 y;
		public uint8 x;
		public uint8 tile;
		public options options;

	}
	enum GPUMode
	{
		GPU_MODE_HBLANK,
		GPU_MODE_VBLANK,
		GPU_MODE_OAM,
		GPU_MODE_VRAM,
	}
	public class GPU
	{
		public uint8 control;
		public uint8 scrollX;
		public uint8 scrollY;
		public uint8 scanline;

		public uint16 address;

		public uint64 tick;
		public uint64 lastTicks = 0;
		public GPUMode mode;

		public uint8[384][8][8] tiles=.();

		public Color[4] backgroundPalette=.(

		);
		public Color[2][4] spritePalette=.();

		public Sprite[] spriteData = new .() ~ delete _;

		public void updateTile(uint16 address, uint8 value)
		{
			uint16 a = address & 0x1ffe;
			uint16 tile = (a >> 4) & 511;
			uint16 y = (a >> 1) & 7;

			uint8 x, bitIndex;
			for (x = 0; x < 8; x++)
			{
				bitIndex = 1 << (7 - x);
				tiles[tile][y][x] = ((cpu.RAM[Memory.VRAM_BEGIN + a] & bitIndex == 1) ? 1 : 0) + ((cpu.RAM[Memory.VRAM_BEGIN + a + 1] & bitIndex == 1) ? 2 : 0);
			}
		}

		public void reset()
		{
			tiles = .();
			for (int i = 0; i < 384; i++)
			{
				tiles[i] = .();
				for (int j = 0; j < 8; j++)
				{
					tiles[i][j] = .(0, 0, 0, 0, 0, 0, 0, 0);
				}
			}
			spriteData = new .();
		}

		public void BuildSpriteData(uint16 address, uint8 val)
		{
			var obj = address >> 2;
			if (obj < 40)
			{
				switch (address & 3)
				{
					// Y-coordinate
				case 0: spriteData[obj].y = val - 16; break;

				// X-coordinate
				case 1: spriteData[obj].x = val - 8; break;

				// Data tile
				case 2: spriteData[obj].tile = val; break;

				// Options
				case 3:
					spriteData[obj].options.palette = (val & 0x10) == 1 ? 1 : 0;
					spriteData[obj].options.hFlip = (val & 0x20) == 1 ? 1 : 0;
					spriteData[obj].options.vFlip = (val & 0x40) == 1 ? 1 : 0;
					spriteData[obj].options.priority = (val & 0x80) == 1 ? 1 : 0;
					break;
				}
			}
		}


		public void GPUStep()
		{
			tick += (uint64)cpu.ticks - lastTicks;

			lastTicks = cpu.ticks;
			switch (mode) {
			case .GPU_MODE_HBLANK:
				if (tick >= 204)
				{
					scanline++;
					if (scanline == 143)
					{
						if (cpu.interrupts.curInterrupt.enable & (1 << 0) == 1) cpu.interrupts.curInterrupt.flags |= (1 << 0);

						mode = .GPU_MODE_VBLANK;

						

						display.RenderImage.SetPixels(.(0, 0, 160, 144), display.screenData);
						display.RenderTexture.SetData(display.RenderImage.Pixels);
					}
					else mode = .GPU_MODE_OAM;
					tick = 0;
				}
				break;
			case .GPU_MODE_VBLANK:
				if (tick >= 456)
				{
					scanline++;
					if (scanline > 153)
					{
						scanline = 0;
						mode = .GPU_MODE_OAM;
					}
					tick = 0;
				}
				break;
			case .GPU_MODE_OAM:
				if (tick >= 80)
				{
					mode = .GPU_MODE_VRAM;

					tick = 0;
				}
				break;
			case .GPU_MODE_VRAM:
				if (tick >= 172)
				{
					mode = .GPU_MODE_HBLANK;
					tick = 0;
					display.renderScanlines();
					
				}
				break;
			}
		}
	}
}
