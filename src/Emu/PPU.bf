using Atma;
using System;
namespace BeefBoy.Emu
{
	/*
	Author:Ryan Levick/Ducktor Cid
	Description: Essentially a port of Ryan Levicks PPU code in his emulator. I take 0 credit apart from porting the code to Beef.


	Original code can be found here: https://github.com/rylev/DMG-01/blob/master/lib-dmg-01/src/gpu.rs

	There's some empty functions due to the fact that I had trouble porting the code. They didn't seem to be used anywhere in the code, so I just left them.
	*/

	public class PPU
	{
		public Color[4] background_colors = .(
			Color.Black,
			Color.Black,
			Color.Black,
			Color.Black
			);

		//Tilemap target
		public enum Tilemap
		{
			X9800,//0x9800
			X9C00//0x9C00
		}

		public enum BgAndWindowDataSelect
		{
			X8000,
			X8800
		}

		public enum ObjSize
		{
			OS8X8,//8x8 pixels
			OS8X16,//8x16 pixels
		}

		public enum Mode
		{
			HBlank = 0,
			VBlank = 1,
			VRAM = 2,
			OAM = 3,
		}
		public enum TilePixelValue
		{
			Zero,
			One,
			Two,
			Three,
		}
		//Palettes for objs
		public enum ObjPalette
		{
			Zero,
			One,
		}

		typealias tileRow = TilePixelValue[8];
		typealias Tile = tileRow[8];

		public struct ObjData
		{
			public int16 x = -16;
			public int16 y = -8;
			public uint8 tile = default;
			public ObjPalette palette = default;
			public bool xFlip = default;
			public bool yFlip = default;
			public bool priority = default;
		}

		public enum InterruptRequest
		{
			None,
			VBlank,
			LCDStat,
			Both
		}

		public struct Window
		{
			public uint8 x;
			public uint8 y;
		}

		public uint8 line;
		public uint8 viewport_x_offset = 0;
		public uint8 viewport_y_offset = 0;
		public uint8 line_check = 0;
		public uint64 ticks = 0;

		public bool lcd_display_enabled = false;
		public bool window_display_enabled = false;
		public bool background_display_enabled = false;
		public bool obj_display_enabled = false;
		public bool line_equals_line_check_interrupt_enabled = false;
		public bool oam_interrupt_enabled = false;
		public bool vblank_interrupt_enabled = false;
		public bool hblank_interrupt_enabled = false;
		public bool line_equals_line_check = false;

		public Tilemap window_tile_map;
		public Tilemap background_tile_map;

		public BgAndWindowDataSelect background_and_window_data_select;
		public ObjSize obj_size;

		public Color obj_0_color_1 = Color.Black;
		public Color obj_0_color_2 = Color.Black;
		public Color obj_0_color_3 = Color.Black;
		public Color obj_1_color_1 = Color.Black;
		public Color obj_1_color_2 = Color.Black;
		public Color obj_1_color_3 = Color.Black;

		public Tile[384] tile_set = .();
		public uint8[166 * 140 * 4] frame_buffer = .();
		public ObjData[40] obj_data = .();

		public Window window = .();

		public Mode mode;



		public this()
		{
			window.x = 0;
			window.y = 0;
		}

		public void write_oam(uint16 address, uint8 value)
		{
			cpu.RAM[address] = value;
			let obj_address = address / 4;

			if (obj_address > 40)
				return;

			let byte = address % 4;
			ObjData data = obj_data[obj_address];
			switch (byte) {
			case 0:
				data.y = (int16)value - 0x10;
			case 1:
				data.y = (int16)value - 0x8;
			case 2:
				data.tile = value;
			default:

				data.palette = (value & 0x10) != 0 ? ObjPalette.One : ObjPalette.Zero;
				data.xFlip = (value & 0x20) != 0;
				data.yFlip = (value & 0x40) != 0;
				data.priority = (value & 0x80) == 0;
			}
		}

		public void write_vram(uint16 address, uint8 value)
		{

			Console.WriteLine(scope $"Writing to VRAM address {address} the value {value}");
			if (address >= 0x1800)
			{
				return;
			}

			// Tiles rows are encoded in two bytes with the first byte always
			// on an even address. Bitwise ANDing the address with 0xffe
			// gives us the address of the first byte.
			// For example: `12 & 0xFFFE == 12` and `13 & 0xFFFE == 12`

			let normalized_address = (address) & 0xFFFE;

			// First we need to get the two bytes that encode the tile row.
			let byte1 = cpu.RAM[normalized_address];
			let byte2 = cpu.RAM[normalized_address + 1];

			// A tiles is 8 rows tall. Since each row is encoded with two bytes a tile
			// is therefore 16 bytes in total.
			let tile_address = address / 16;
			// Every two bytes is a new row
			let row_address = (address % 16) / 2;

			// Now we're going to loop 8 times to get the 8 pixels that make up a given row.
			for (int i = 0; i < 8; i++)
			{
				// To determine a pixel's value we must first find the corresponding bit that encodes
				// that pixels value:
				// 1111_1111
				// 0123 4567
				//
				// As you can see the bit that corresponds to the nth pixel is the bit in the nth
				// position *from the left*. Bits are normally addressed from the right.
				//
				// To find the first pixel (a.k.a pixel 0) we find the left most bit (a.k.a bit 7). For
				// the second pixel (a.k.a pixel 1) we first the second most left bit (a.k.a bit 6) and
				// so on.
				//
				// We then create a mask with a 1 at that position and 0s everywhere else.
				//
				// Bitwise ANDing this mask with our bytes will leave that particular bit with its
				// original value and every other bit with a 0.
				let mask = 1 << (7 - i);
				let lsb = byte1 & mask;
				let msb = byte2 & mask;

				// If the masked values are not 0 the masked bit must be 1. If they are 0, the masked
				// bit must be 0.
				//
				// Finally we can tell which of the four tile values the pixel is. For example, if the least
				// significant byte's bit is 1 and the most significant byte's bit is also 1, then we
				// have tile value `Three`.
				TilePixelValue val = TilePixelValue.Zero;
				switch ((lsb != 0, msb != 0)) {
				case (true, true):
					val = TilePixelValue.Three;
				case (false, true):
					val = TilePixelValue.Two;
				case (true, false):
					val = TilePixelValue.One;
				case (false, false):
					val = TilePixelValue.Zero;
				}

				tile_set[tile_address][row_address][i] = val;
			}
		}

		public void AddRequest(ref InterruptRequest addingTo, InterruptRequest addition)
		{
			switch (addingTo) {
			case .None:
				addingTo = addition;
			case when (addingTo == .VBlank && addition == .LCDStat) || (addingTo == .LCDStat && addition == .VBlank):
				addingTo = .Both;
			default:
				return;
			}
		}

		public InterruptRequest step()
		{
			InterruptRequest interrupt_request = InterruptRequest.None;
			if (lcd_display_enabled)
			{
				return interrupt_request;
			}
			ticks += cpu.ticks;

			switch (mode) {
			case .HBlank:
				if (ticks >= 200)
				{
					ticks = ticks % 200;
					line += 1;

					if (line >= 144)
					{
						mode = .VBlank;
						AddRequest(ref interrupt_request, .VBlank);
						if (vblank_interrupt_enabled)
						{
							AddRequest(ref interrupt_request, .LCDStat);
							display.RenderImage.SetPixels(.(0, 0, 160, 144), display.screenData);
							display.RenderTexture.SetData(display.RenderImage.Pixels);
						} else
						{
							mode=.OAM;
							if(oam_interrupt_enabled){
								AddRequest(ref interrupt_request,.LCDStat);
							}
						}
					}
				}
			case .OAM:
				if (ticks >= 80)
				{
					ticks = ticks % 80;
					mode = .VRAM;
				}
			case .VBlank:
				if (ticks >= 456)
				{
					ticks = ticks % 456;
					line += 1;
					if (line == 154)
					{
						mode = .OAM;
						line=0;
						if(oam_interrupt_enabled){
							AddRequest(ref interrupt_request, .LCDStat);
						}
					}
					set_equal_lines_check(ref interrupt_request);
				}
			case .VRAM:
				if (ticks >= 172)
				{
					ticks = ticks % 172;
					if (hblank_interrupt_enabled)
					{
						AddRequest(ref interrupt_request,.LCDStat);
					}
					mode = .HBlank;
					render_scanlines();
				}
			}
			return interrupt_request;
		}

		void set_equal_lines_check(ref InterruptRequest request)
		{
			let line_equals_line_check = line == line_check;

			if (line_equals_line_check && line_equals_line_check_interrupt_enabled)
			{
				AddRequest(ref request,.LCDStat);
			}
		}

		public uint8[] background_1(){
			uint8[] newArray=new uint8[0x1C00-0x1800];
			Array.Copy(*cpu.RAM.get_vram_space(),0x1800,newArray,0,0x1C00-0x1800);
			return newArray;
		}

		public uint8[] background_as_buffer(bool outline_tiles,bool show_viewport){
			return null;
		}

		public uint8[] tile_set_as_buffer(bool outline_tiles){
			return null;
		}

		public void render_scanlines(){
			TilePixelValue[144] scanline =.();

			if (background_display_enabled) {
			    // The x index of the current tile
			    uint16 tile_x_index = viewport_x_offset / 8;
			    // The current scan line's y-offset in the entire background space is a combination
			    // of both the line inside the view port we're currently on and the amount of the view port is scrolled
			    let tile_y_index = line+(viewport_y_offset);
			    // The current tile we're on is equal to the total y offset broken up into 8 pixel chunks
			    // and multipled by the width of the entire background (i.e. 32 tiles)
			    let tile_offset = (tile_y_index/ 8) * 32;

			    // Where is our tile map defined?
			    let background_tile_map = background_tile_map ==  .X9800 ? 0x9800 : 0x9C00;
			    
			    // Munge this so that the beginning of VRAM is index 0
			    let tile_map_begin = background_tile_map - Memory.VRAM_BEGIN;
			    // Where we are in the tile map is the beginning of the tile map
			    // plus the current tile's offset
			    let tile_map_offset = tile_map_begin + tile_offset;

			    // When line and scrollY are zero we just start at the top of the tile
			    // If they're non-zero we must index into the tile cycling through 0 - 7
			    let row_y_offset = tile_y_index % 8;
			    uint16 pixel_x_index = viewport_x_offset % 8;

			    if (background_and_window_data_select == .X8800) {
					Internal.FatalError("0x8800 background unsupported");
			    }

			    uint16 canvas_buffer_offset = line * 144 * 4;
			    // Start at the beginning of the line and go pixel by pixel
			    for(uint16 line_x=0; line_x < 144; line_x++){
			        // Grab the tile index specified in the tile map
			        let tile_index = cpu.RAM[Memory.VRAM_BEGIN+(uint16)tile_map_offset + tile_x_index];

			        let tile_value = tile_set[tile_index][row_y_offset][pixel_x_index];
			        let color = tile_value_to_background_color(&tile_value);

			        display.screenData[canvas_buffer_offset] = (uint8)color;
			        display.screenData[canvas_buffer_offset + 1] = (uint8)color;
			        display.screenData[canvas_buffer_offset + 2] = (uint8)color;
			        display.screenData[canvas_buffer_offset + 3] = 255;
			        canvas_buffer_offset += 4;
			        scanline[line_x] = tile_value;
			        // Loop through the 8 pixels within the tile
			        pixel_x_index = (pixel_x_index + 1) % 8;

			        // Check if we've fully looped through the tile
			        if (pixel_x_index == 0) {
			            // Now increase the tile x_offset by 1
			            tile_x_index = tile_x_index + 1;
			        }
			        if (background_and_window_data_select == .X8800){
						Internal.FatalError("0x8800 background unsupported");
			        }
			    }
			}

			if (obj_display_enabled) {
			    let object_height = obj_size == .OS8X16 ? 8 : 16;
			    for (var object in obj_data.GetEnumerator()) {
			        let line = (int16)line;
			        if (object.y <= line && object.y + object_height > line) {
			            let pixel_y_offset = line - object.y;
						uint16 tile_index=0;
						if(object_height==16 &&(!object.yFlip && pixel_y_offset>7) || (object.yFlip && pixel_y_offset<=7)){
							tile_index=object.tile+1;
						}
						else{
							tile_index=object.tile;
						}
			            Tile tile = tile_set[tile_index];
			            tileRow tile_row = object.yFlip ? tile[(7 - (pixel_y_offset % 8))]:
			                tile[(pixel_y_offset % 8)];
			            

			            let canvas_y_offset = (int32)line * (int32)144;
			            uint16 canvas_offset = uint16((canvas_y_offset + (int32)object.x) * 4);
			            for(int16 x=0; x<8; x++) {
			                let pixel_x_offset = object.xFlip ? (7-x) : x;

			                let x_offset = object.x + x;
			                let pixel = tile_row[pixel_x_offset];
			                if (x_offset >= 0
			                    && x_offset < (int16)144
			                    && pixel != .Zero
			                    && (object.priority
			                        || scanline[x_offset] == .Zero))
			                {
			                    let color = tile_value_to_background_color(&pixel);

			                    display.screenData[canvas_offset + 0] = (uint8)color;
			                    display.screenData[canvas_offset + 1] = (uint8)color;
			                    display.screenData[canvas_offset + 2] = (uint8)color;
			                    display.screenData[canvas_offset + 3] = 255;
			                }
			                canvas_offset += 4;
			            }
			        }
			    }
			}

		}
		public Color tile_value_to_background_color(TilePixelValue* val){
			switch(val){
			case .Zero:
				return background_colors[0];
			case .One:
				return background_colors[1];
			case .Two:
				return background_colors[2];
			case .Three:
				return background_colors[3];
			}
		}
	}
}
