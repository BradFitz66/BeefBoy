using Atma;
using System;
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
	enum PPUMode
	{
		PPU_MODE_HBLANK,
		PPU_MODE_VBLANK,
		PPU_MODE_OAM,
		PPU_MODE_VRAM,
	}

	public class PPU
	{
		public uint8 control;
		public uint8 scrollX;
		public uint8 scrollY;
		public uint8 scanline;

		public uint16 address;

		public uint64 tick;
		public uint64 lastTicks = 0;
		public PPUMode mode = .PPU_MODE_HBLANK;

		public uint8[384][8][8] tiles = .();

		public Color[4] backgroundPalette = .(
			Color.Black,
			Color.Black,
			Color.Black,
			Color.Black
		);
		public Color[2][4] spritePalette = .(
			.(Color.Black, Color.Black, Color.Black, Color.Black),
			.(Color.Black, Color.Black, Color.Black, Color.Black)
		);



		public void updateTile(uint16 address, uint8 value)
		{
			//Get 'base' address for tile rwo
			uint16 a = address & 0x1ffe;

			//Which tile was updated?
			uint16 tile = (a >> 4) & 511;
			uint16 y = (a >> 1) & 7;

			uint8 sx;
			for (int x = 0; x < 8; x++)
			{
				sx = 1 << (7 - x);
				tiles[tile][y][x] = ((cpu.RAM[Memory.VRAM_BEGIN + a] & sx> 0) ? 1 : 0) + ((cpu.RAM[Memory.VRAM_BEGIN + (a + 1)] & sx > 0) ? 2 : 0);
			}
		}

		public this()
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
		}




		public void GPUStep()
		{
			tick += cpu.ticks - lastTicks;

			lastTicks = cpu.ticks;

			switch (mode) {
			case .PPU_MODE_HBLANK:
				if (tick >= 204)
				{
					scanline++;
					if (scanline == 143)
					{
						System.Console.WriteLine("Finished screen. Rendering");
						if (cpu.interrupts.curInterrupt.enable & (1 << 0) > 0) cpu.interrupts.curInterrupt.flags |= (1 << 0);

						mode = .PPU_MODE_VBLANK;

						display.RenderImage.SetPixels(.(0, 0, 160, 144), display.screenData);
						display.RenderTexture.SetData(display.RenderImage.Pixels);
					}
					else mode = .PPU_MODE_OAM;
					tick -= 204;
				}
				break;
			case .PPU_MODE_VBLANK:
				if (tick >= 456)
				{
					scanline++;
					if (scanline > 153)
					{
						scanline = 0;
						mode = .PPU_MODE_OAM;
					}
					tick -= 456;
				}
				break;
			case .PPU_MODE_OAM:
				if (tick >= 80)
				{
					mode = .PPU_MODE_VRAM;

					tick -= 80;
				}
				break;
			case .PPU_MODE_VRAM:
				if (tick >= 172)
				{
					mode = .PPU_MODE_HBLANK;
					display.renderScanlines();
					tick -= 172;
				}
				break;
			}
		}
	}
}
