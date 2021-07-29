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
				screenData[i] = .(200, 200, 200);
			}

			RenderImage.SetPixels(.(0, 0, 160, 144), screenData);
			RenderTexture.SetData(RenderImage.Pixels);
		}


		public ~this()
		{
			Running = false;
		}

		protected override void Update()
		{
			cpu.step();
			ppu.step();
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
