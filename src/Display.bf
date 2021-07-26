using Atma;
using System;
using BeefBoy.Emu;
namespace BeefBoy
{
	class Display : Core
	{
		public bool Running
		{
			get;
			private set;
		}

		public Image RenderImage ~ delete _;
		public Texture RenderTexture ~ delete _;
		public Color[] screenData = new Color[160 * 144] ~ delete _;

		public Color[4] PALETTE = .(
			.(255, 255, 255),
			.(192, 192, 192),
			.(96, 96, 96),
			.(0, 0, 0)
		);

		public this(System.StringView title, int width, int height, Window.WindowFlags windowFlags) : base(title, width, height, windowFlags)
		{
			Running = true;
		}

		

		protected override void Initialize()
		{
			RenderImage = new Image(160, 144, Color.Transparent);

			RenderTexture = new .(RenderImage);
			RenderTexture.Filter = .Nearest;
			for (int i = 0; i < 160 * 144; i++)
			{
				screenData[i] = .(0, 0, 0);
			}

			RenderImage.SetPixels(.(0, 0, 160, 144), screenData);
			RenderTexture.SetData(RenderImage.Pixels);
		}


		public void renderScanlines()
		{
			uint16 mapOffset = (gpu.control & (1 << 3) == 1) ? 0x1c00 : 0x1800;
			mapOffset += (((gpu.scanline + gpu.scrollY) & 255) >> 3) << 5;

			uint16 lineOffset = (gpu.scrollX >> 3);

			int x = gpu.scrollX & 7;
			int y = (gpu.scanline + gpu.scrollY) & 7;

			uint16 pixelOffset;
			pixelOffset = gpu.scanline * 160;



			uint16 tile = (uint16)cpu.RAM[Memory.VRAM_BEGIN + (mapOffset + lineOffset)];

			uint8[160] scanlineRow = .();

			// if bg enabled
			int i;
			for (i = 0; i < 160; i++)
			{
				uint8 Color = gpu.tiles[tile][y][x];

				scanlineRow[i] = Color;

				screenData[pixelOffset].R = gpu.backgroundPalette[Color].R;
				screenData[pixelOffset].G = gpu.backgroundPalette[Color].G;
				screenData[pixelOffset].B = gpu.backgroundPalette[Color].B;
				x++;
				if (x == 8)
				{
					x = 0;
					lineOffset = (lineOffset + 1) & 31;
					tile = cpu.RAM[Memory.VRAM_BEGIN + (mapOffset + lineOffset)];
				}
			}

			// if sprites enabled
			for (i = 0; i < 40; i++)
			{

				Sprite sprite = .();
				let index=i*4;

				sprite.y=cpu.RAM[Memory.OAM_BEGIN+(uint16)index]-16;
				sprite.x=cpu.RAM[Memory.OAM_BEGIN+(uint16)index+1]-8;
				sprite.tile=cpu.RAM[Memory.OAM_BEGIN+(uint16)index+3];

				let attributes=cpu.RAM[Memory.OAM_BEGIN+(uint16)index+3];
				sprite.options.vFlip=Utils.getBit(attributes,6);
				sprite.options.hFlip=Utils.getBit(attributes,5);
				sprite.options.priority=Utils.getBit(attributes,7);


				Console.WriteLine(sprite.x);

				uint8 sx = sprite.x;
				uint8 sy = sprite.y;

				if (sy <= gpu.scanline && (sy + 8) > gpu.scanline)
				{

					Color[4] pal = gpu.spritePalette[sprite.options.palette];

					uint8 pixelOffset2;
					pixelOffset2 = gpu.scanline * 160 + sx;


					uint8 tileRow;
					if (sprite.options.vFlip == 1) tileRow = 7 - (gpu.scanline - sy);
					else tileRow = gpu.scanline - sy;

					int x2;
					for (x2 = 0; x2 < 8; x2++)
					{
						if (sx + x2 >= 0 && sx + x2 < 160 && (~sprite.options.priority == 1 || scanlineRow[sx + x] == 0))
						{
							uint8 Color;

							if (sprite.options.hFlip == 1) Color = gpu.tiles[sprite.tile][tileRow][7 - x];
							else Color = gpu.tiles[sprite.tile][tileRow][x];

							if (Color == 1)
							{
								screenData[pixelOffset].R = pal[Color].R;
								screenData[pixelOffset].G = pal[Color].G;
								screenData[pixelOffset].B = pal[Color].B;
							}
							pixelOffset++;
						}
					}
				}
			}
		}

		public ~this()
		{
			Running = false;
		}

		protected override void Update()
		{
			cpu.step();
			gpu.GPUStep();
		}

		protected override void FixedUpdate()
		{
		}

		protected override void Render()
		{
			Draw.Image(RenderTexture, rect(0, 0, .(Core.Window.Width, Core.Window.Height)), Color.White);
			Draw.Render(Core.Window);
		}



		protected override void Unload()
		{
		}


	}
}
