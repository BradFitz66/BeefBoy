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
				screenData[i] = .(50, 0, 0);
			}

			RenderImage.SetPixels(.(0, 0, 160, 144), screenData);
			RenderTexture.SetData(RenderImage.Pixels);
		}

		public void drawTiles(){
			uint16 mapoffs=(ppu.control &(1<<3))>0 ? 0x1c00 : 0x1800;

			mapoffs+=(((ppu.scanline+ppu.scrollY)&255)>>3)<<5;

			uint16 lineoffs=ppu.scrollX>>3;

			uint8 x=ppu.scrollX & 7;
			uint8 y=(ppu.scanline+ppu.scrollY)&7;

			uint8 pixelOffset=0;

			pixelOffset=ppu.scanline * 160;

			Color color=Color.Transparent;
			uint16 tile=cpu.RAM[Memory.VRAM_BEGIN+(mapoffs+lineoffs)];

			if((ppu.control & (1<<4))>0 && tile < 128) tile += 256;

			for(int i=0; i<160; i++){
				color=ppu.backgroundPalette[ppu.tiles[tile][y][x]];
				screenData[pixelOffset].R=color.R;
				screenData[pixelOffset].G=color.G;
				screenData[pixelOffset].B=color.B;
				pixelOffset+=4;

				x++;
				if(x==8){
					x=0;
					lineoffs=(lineoffs+1)&31;
					tile=cpu.RAM[Memory.VRAM_BEGIN+(mapoffs+lineoffs)];
					if((ppu.control & (1<<4))>0 && tile < 128) tile += 256;
				}
			}
		}

		public void renderScanlines()
		{
			drawTiles();
			display.RenderImage.SetPixels(.(0, 0, 160, 144), display.screenData);
			display.RenderTexture.SetData(display.RenderImage.Pixels);
		}

		public ~this()
		{
			Running = false;
		}

		protected override void Update()
		{
			cpu.step();
			ppu.GPUStep();
			cpu.interrupts.step();
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
