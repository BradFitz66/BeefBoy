using System;
using System.Collections;

using BeefBoy.Emu.Instructions;
namespace BeefBoy.Emu
{



//	struct Clock{
//		uint8
//	}

	struct Registers
	{

		//registers are initialized to the values they would be after the boot rom is ran.
		public uint8 a=0x01;
		public uint8 b=0x00;
		public uint8 c=0x13;
		public uint8 d=0x00;
		public uint8 e=0xD8;
		public uint8 h=0x01;
		public uint8 l=0x4D;

		public uint8 flags=0xB0;
		public uint16 sp=0xFFFE;
		public uint16 pc=0x100;
		public uint16 af
		{
			get { return (uint16)a << 8 | flags; }
		};
		public uint16 bc
		{
			get { return (uint16)b << 8 | c; }
			set mut
			{
				b = (uint8)((value >> 8) & 0xFF);
				c = (uint8)(value & 0xFF);
			}
		};
		public uint16 de
		{
			get { return (uint16)d << 8 | e; }
			set mut
			{
				d = (uint8)((value >> 8) & 0xFF);
				e = (uint8)(value & 0xFF);
			}
		};
		public uint16 hl
		{
			get { return (uint16)h << 8 | l; }
			set mut
			{
				h = (uint8)((value >> 8) & 0xFF);
				l = (uint8)(value & 0xFF);
			}
		};
	}

	//Define a typealias for the execute function. We have two optional arguments for operand length for opcodes like LD
	// SP, u16


	typealias instructionExec = function void(uint8, uint16);
	public struct instruction
	{
		public String disassembly = "null";
		public uint8 operandLength = 0;
		public instructionExec execute = => CPU.undefined;
		public this(String disasm, uint8 leng, instructionExec exec)
		{
			disassembly = disasm;
			operandLength = leng;
			execute = exec;
		}

		//unsigned char ticks;
	}



	class CPU
	{
		public Memory RAM ~ delete _;
		public Registers registers = .();

		//Array of all non-prefixed instructions
		public instruction[256] instructions = .(
			.("NOP"                  , (uint8)1, => nop                               ),
			.("LD BC, u16"           , (uint8)2, => LoadFunctions         .ld_bc_nn   ),
			.("LD .(BC), A"          , (uint8)0, => LoadFunctions         .ld_bc_a    ),
			.("INC BC"               , (uint8)0, => IncDecFunctions       .inc_bc     ),
			.("INC B"                , (uint8)0, => IncDecFunctions       .inc_b      ),
			.("DEC B"                , (uint8)0, => IncDecFunctions       .dec_b      ),
			.("LD B, u8"             , (uint8)1, => LoadFunctions         .ld_b_n     ),
			.("RLCA"                 , (uint8)0, => BitwiseFunctions      .rlca       ),
			.("LD .(u16), SP"        , (uint8)2, => LoadFunctions         .ld_nn_sp   ),
			.("ADD HL, BC"           , (uint8)0, => AddFunctions          .add_hl_bc  ),
			.("LD A, .(BC)"          , (uint8)0, => LoadFunctions         .ld_a_bc    ),
			.("DEC BC"               , (uint8)0, => IncDecFunctions       .dec_bc     ),
			.("INC C"                , (uint8)0, => IncDecFunctions       .inc_c      ),
			.("DEC C"                , (uint8)0, => IncDecFunctions       .dec_c      ),
			.("LD C, u8"             , (uint8)1, => LoadFunctions         .ld_c_n     ),
			.("RRCA"                 , (uint8)0, => BitwiseFunctions      .rrca       ),
			.("STOP"                 , (uint8)1, => MiscellaneousFunctions.stop       ),
			.("LD DE, u16"           , (uint8)2, => LoadFunctions         .ld_de_nn   ),
			.("LD .(DE), A"          , (uint8)0, => LoadFunctions         .ld_de_a    ),
			.("INC DE"               , (uint8)0, => IncDecFunctions       .inc_de     ),
			.("INC D"                , (uint8)0, => IncDecFunctions       .inc_d      ),
			.("DEC D"                , (uint8)0, => IncDecFunctions       .dec_d      ),
			.("LD D, u8"             , (uint8)1, => LoadFunctions         .ld_d_n     ),
			.("RLA"                  , (uint8)0, => BitwiseFunctions      .rla        ),
			.("JR u8"                , (uint8)1, => JumpFunctions         .jr_n       ),
			.("ADD HL, DE"           , (uint8)0, => AddFunctions          .add_hl_de  ),
			.("LD A, .(DE)"          , (uint8)0, => LoadFunctions         .ld_a_de    ),
			.("DEC DE"               , (uint8)0, => IncDecFunctions       .dec_de     ),
			.("INC E"                , (uint8)0, => IncDecFunctions       .inc_e      ),
			.("DEC E"                , (uint8)0, => IncDecFunctions       .dec_e      ),
			.("LD E, u8"             , (uint8)1, => LoadFunctions         .ld_e_n     ),
			.("RRA"                  , (uint8)0, => BitwiseFunctions      .rra        ),
			.("JR NZ, u8"            , (uint8)1, => JumpFunctions         .jr_nz_n    ),
			.("LD HL, u16"           , (uint8)2, => LoadFunctions         .ld_hl_nn   ),
			.("LDI .(HL), A"         , (uint8)0, => LoadFunctions         .ldi_hl_a   ),
			.("INC HL"               , (uint8)0, => IncDecFunctions       .inc_hl     ),
			.("INC H"                , (uint8)0, => IncDecFunctions       .inc_h      ),
			.("DEC H"                , (uint8)0, => IncDecFunctions       .dec_h      ),
			.("LD H, u8"             , (uint8)1, => LoadFunctions         .ld_h_n     ),
			.("DAA"                  , (uint8)0, => MiscellaneousFunctions.daa        ),
			.("JR Z, u8"             , (uint8)1, => JumpFunctions         .jr_z_n     ),
			.("ADD HL, HL"           , (uint8)0, => AddFunctions          .add_hl_hl  ),
			.("LDI A, .(HL)"         , (uint8)0, => LoadFunctions         .ldi_a_hl   ),
			.("DEC HL"               , (uint8)0, => IncDecFunctions       .dec_hl     ),
			.("INC L"                , (uint8)0, => IncDecFunctions       .inc_l      ),
			.("DEC L"                , (uint8)0, => IncDecFunctions       .dec_l      ),
			.("LD L, u8"             , (uint8)1, => LoadFunctions         .ld_l_n     ),
			.("CPL"                  , (uint8)0, => MiscellaneousFunctions.cpl        ),
			.("JR NC, u8"            , (uint8)1, => JumpFunctions         .jr_nc_n    ),
			.("LD SP, u16"           , (uint8)2, => LoadFunctions         .ld_sp_nn   ),
			.("LDD .(HL), A"         , (uint8)0, => LoadFunctions         .ldd_hl_a   ),
			.("INC SP"               , (uint8)0, => IncDecFunctions       .inc_sp     ),
			.("INC .(HL)"            , (uint8)0, => IncDecFunctions       .inc_hl     ),
			.("DEC .(HL)"            , (uint8)0, => IncDecFunctions       .dec_hl     ),
			.("LD .(HL), u8"         , (uint8)1, => LoadFunctions         .ld_hl_n    ),
			.("SCF"                  , (uint8)0, => MiscellaneousFunctions.scf        ),
			.("JR C, u8"             , (uint8)1, => JumpFunctions         .jr_c_n     ),
			.("ADD HL, SP"           , (uint8)0, => AddFunctions          .add_hl_sp  ),
			.("LDD A, .(HL)"         , (uint8)0, => LoadFunctions         .ldd_a_hl   ),
			.("DEC SP"               , (uint8)0, => IncDecFunctions       .dec_sp     ),
			.("INC A"                , (uint8)0, => IncDecFunctions       .inc_a      ),
			.("DEC A"                , (uint8)0, => IncDecFunctions       .dec_a      ),
			.("LD A, u8"             , (uint8)1, => LoadFunctions         .ld_a_n     ),
			.("CCF"                  , (uint8)0, => MiscellaneousFunctions.ccf        ),
			.("LD B, B"              , (uint8)0, => nop                               ),//Loading a register into itself is fuctionally the same as the NOP command
			.("LD B, C"              , (uint8)0, => LoadFunctions         .ld_b_c     ),
			.("LD B, D"              , (uint8)0, => LoadFunctions         .ld_b_d     ),
			.("LD B, E"              , (uint8)0, => LoadFunctions         .ld_b_e     ),
			.("LD B, H"              , (uint8)0, => LoadFunctions         .ld_b_h     ),
			.("LD B, L"              , (uint8)0, => LoadFunctions         .ld_b_l     ),
			.("LD B, .(HL)"          , (uint8)0, => LoadFunctions         .ld_b_hl    ),
			.("LD B, A"              , (uint8)0, => LoadFunctions         .ld_b_a     ),
			.("LD C, B"              , (uint8)0, => LoadFunctions         .ld_c_b     ),
			.("LD C, C"              , (uint8)0, => nop                               ),
			.("LD C, D"              , (uint8)0, => LoadFunctions         .ld_c_d     ),
			.("LD C, E"              , (uint8)0, => LoadFunctions         .ld_c_e     ),
			.("LD C, H"              , (uint8)0, => LoadFunctions         .ld_c_h     ),
			.("LD C, L"              , (uint8)0, => LoadFunctions         .ld_c_l     ),
			.("LD C, .(HL)"          , (uint8)0, => LoadFunctions         .ld_c_hl    ),
			.("LD C, A"              , (uint8)0, => LoadFunctions         .ld_c_a     ),
			.("LD D, B"              , (uint8)0, => LoadFunctions         .ld_d_b     ),
			.("LD D, C"              , (uint8)0, => LoadFunctions         .ld_d_c     ),
			.("LD D, D"              , (uint8)0, => nop                               ),
			.("LD D, E"              , (uint8)0, => LoadFunctions         .ld_d_e     ),
			.("LD D, H"              , (uint8)0, => LoadFunctions         .ld_d_h     ),
			.("LD D, L"              , (uint8)0, => LoadFunctions         .ld_d_l     ),
			.("LD D, .(HL)"          , (uint8)0, => LoadFunctions         .ld_d_hl    ),
			.("LD D, A"              , (uint8)0, => LoadFunctions         .ld_d_a     ),
			.("LD E, B"              , (uint8)0, => LoadFunctions         .ld_e_b     ),
			.("LD E, C"              , (uint8)0, => LoadFunctions         .ld_e_c     ),
			.("LD E, D"              , (uint8)0, => LoadFunctions         .ld_e_d     ),
			.("LD E, E"              , (uint8)0, => nop                               ),
			.("LD E, H"              , (uint8)0, => LoadFunctions         .ld_e_h     ),
			.("LD E, L"              , (uint8)0, => LoadFunctions         .ld_e_l     ),
			.("LD E, .(HL)"          , (uint8)0, => LoadFunctions         .ld_e_hl    ),
			.("LD E, A"              , (uint8)0, => LoadFunctions         .ld_e_a     ),
			.("LD H, B"              , (uint8)0, => LoadFunctions         .ld_h_b     ),
			.("LD H, C"              , (uint8)0, => LoadFunctions         .ld_h_c     ),
			.("LD H, D"              , (uint8)0, => LoadFunctions         .ld_h_d     ),
			.("LD H, E"              , (uint8)0, => LoadFunctions         .ld_h_e     ),
			.("LD H, H"              , (uint8)0, => nop                               ),
			.("LD H, L"              , (uint8)0, => LoadFunctions         .ld_h_l     ),
			.("LD H, .(HL)"          , (uint8)0, => LoadFunctions         .ld_h_hl    ),
			.("LD H, A"              , (uint8)0, => LoadFunctions         .ld_h_a     ),
			.("LD L, B"              , (uint8)0, => LoadFunctions         .ld_l_b     ),
			.("LD L, C"              , (uint8)0, => LoadFunctions         .ld_l_c     ),
			.("LD L, D"              , (uint8)0, => LoadFunctions         .ld_l_d     ),
			.("LD L, E"              , (uint8)0, => LoadFunctions         .ld_l_e     ),
			.("LD L, H"              , (uint8)0, => LoadFunctions         .ld_l_h     ),
			.("LD L, L"              , (uint8)0, => nop                               ),
			.("LD L, .(HL)"          , (uint8)0, => LoadFunctions         .ld_l_hl    ),
			.("LD L, A"              , (uint8)0, => LoadFunctions         .ld_l_a     ),
			.("LD .(HL), B"          , (uint8)0, => LoadFunctions         .ld_hl_b    ),
			.("LD .(HL), C"          , (uint8)0, => LoadFunctions         .ld_hl_c    ),
			.("LD .(HL), D"          , (uint8)0, => LoadFunctions         .ld_hl_d    ),
			.("LD .(HL), E"          , (uint8)0, => LoadFunctions         .ld_hl_e    ),
			.("LD .(HL), H"          , (uint8)0, => LoadFunctions         .ld_hl_h    ),
			.("LD .(HL), L"          , (uint8)0, => LoadFunctions         .ld_hl_l    ),
			.("HALT"                 , (uint8)0, => MiscellaneousFunctions.halt       ),
			.("LD .(HL), A"          , (uint8)0, => LoadFunctions         .ld_hl_a    ),
			.("LD A, B"              , (uint8)0, => LoadFunctions         .ld_a_b     ),
			.("LD A, C"              , (uint8)0, => LoadFunctions         .ld_a_c     ),
			.("LD A, D"              , (uint8)0, => LoadFunctions         .ld_a_d     ),
			.("LD A, E"              , (uint8)0, => LoadFunctions         .ld_a_e     ),
			.("LD A, H"              , (uint8)0, => LoadFunctions         .ld_a_h     ),
			.("LD A, L"              , (uint8)0, => LoadFunctions         .ld_a_l     ),
			.("LD A, .(HL)"          , (uint8)0, => LoadFunctions         .ld_a_hl    ),
			.("LD A, A"              , (uint8)0, => nop                               ),
			.("ADD A, B"             , (uint8)0, => AddFunctions          .add_a_b    ),
			.("ADD A, C"             , (uint8)0, => AddFunctions          .add_a_c    ),
			.("ADD A, D"             , (uint8)0, => AddFunctions          .add_a_d    ),
			.("ADD A, E"             , (uint8)0, => AddFunctions          .add_a_e    ),
			.("ADD A, H"             , (uint8)0, => AddFunctions          .add_a_h    ),
			.("ADD A, L"             , (uint8)0, => AddFunctions          .add_a_l    ),
			.("ADD A, .(HL)"         , (uint8)0, => AddFunctions          .add_a_hl   ),
			.("ADD A"                , (uint8)0, => AddFunctions          .add_a_a    ),
			.("ADC C"                , (uint8)0, => AdcFunctions          .adc_c      ),
			.("ADC D"                , (uint8)0, => AdcFunctions          .adc_d      ),
			.("ADC E"                , (uint8)0, => AdcFunctions          .adc_e      ),
			.("ADC B"                , (uint8)0, => AdcFunctions          .adc_b      ),
			.("ADC H"                , (uint8)0, => AdcFunctions          .adc_h      ),
			.("ADC L"                , (uint8)0, => AdcFunctions          .adc_l      ),
			.("ADC .(HL)"            , (uint8)0, => AdcFunctions          .adc_hl     ),
			.("ADC A"                , (uint8)0, => AdcFunctions          .adc_a      ),
			.("SUB B"                , (uint8)0, => SubFunctions          .sub_b      ),
			.("SUB C"                , (uint8)0, => SubFunctions          .sub_c      ),
			.("SUB D"                , (uint8)0, => SubFunctions          .sub_d      ),
			.("SUB E"                , (uint8)0, => SubFunctions          .sub_e      ),
			.("SUB H"                , (uint8)0, => SubFunctions          .sub_h      ),
			.("SUB L"                , (uint8)0, => SubFunctions          .sub_l      ),
			.("SUB .(HL)"            , (uint8)0, => SubFunctions          .sub_hl     ),
			.("SUB A"                , (uint8)0, => SubFunctions          .sub_a      ),
			.("SBC B"                , (uint8)0, => SbcFunctions          .sbc_b      ),
			.("SBC C"                , (uint8)0, => SbcFunctions          .sbc_c      ),
			.("SBC D"                , (uint8)0, => SbcFunctions          .sbc_d      ),
			.("SBC E"                , (uint8)0, => SbcFunctions          .sbc_e      ),
			.("SBC H"                , (uint8)0, => SbcFunctions          .sbc_h      ),
			.("SBC L"                , (uint8)0, => SbcFunctions          .sbc_l      ),
			.("SBC .(HL)"            , (uint8)0, => SbcFunctions          .sbc_hl     ),
			.("SBC A"                , (uint8)0, => SbcFunctions          .sbc_a      ),
			.("AND C"                , (uint8)0, => BitwiseFunctions      .and_c      ),
			.("AND D"                , (uint8)0, => BitwiseFunctions      .and_d      ),
			.("AND B"                , (uint8)0, => BitwiseFunctions      .and_b      ),
			.("AND E"                , (uint8)0, => BitwiseFunctions      .and_e      ),
			.("AND H"                , (uint8)0, => BitwiseFunctions      .and_h      ),
			.("AND L"                , (uint8)0, => BitwiseFunctions      .and_l      ),
			.("AND .(HL)"            , (uint8)0, => BitwiseFunctions      .and_hl     ),
			.("AND A"                , (uint8)0, => BitwiseFunctions      .and_a      ),
			.("XOR C"                , (uint8)0, => BitwiseFunctions      .xor_c      ),
			.("XOR B"                , (uint8)0, => BitwiseFunctions      .xor_b      ),
			.("XOR D"                , (uint8)0, => BitwiseFunctions      .xor_d      ),
			.("XOR E"                , (uint8)0, => BitwiseFunctions      .xor_e      ),
			.("XOR H"                , (uint8)0, => BitwiseFunctions      .xor_h      ),
			.("XOR L"                , (uint8)0, => BitwiseFunctions      .xor_l      ),
			.("XOR .(HL)"            , (uint8)0, => BitwiseFunctions      .xor_hl     ),
			.("XOR A"                , (uint8)0, => BitwiseFunctions      .xor_a      ),
			.("OR B"                 , (uint8)0, => BitwiseFunctions      .or_b       ),
			.("OR C"                 , (uint8)0, => BitwiseFunctions      .or_c       ),
			.("OR D"                 , (uint8)0, => BitwiseFunctions      .or_d       ),
			.("OR E"                 , (uint8)0, => BitwiseFunctions      .or_e       ),
			.("OR H"                 , (uint8)0, => BitwiseFunctions      .or_h       ),
			.("OR L"                 , (uint8)0, => BitwiseFunctions      .or_l       ),
			.("OR .(HL)"             , (uint8)0, => BitwiseFunctions      .or_hl      ),
			.("OR A"                 , (uint8)0, => BitwiseFunctions      .or_a       ),
			.("CP B"                 , (uint8)0, => CompareFunctions      .cp_b       ),
			.("CP C"                 , (uint8)0, => CompareFunctions      .cp_c       ),
			.("CP D"                 , (uint8)0, => CompareFunctions      .cp_d       ),
			.("CP E"                 , (uint8)0, => CompareFunctions      .cp_e       ),
			.("CP H"                 , (uint8)0, => CompareFunctions      .cp_h       ),
			.("CP L"                 , (uint8)0, => CompareFunctions      .cp_l       ),
			.("CP .(HL)"             , (uint8)0, => CompareFunctions      .cp_hl      ),
			.("CP A"                 , (uint8)0, => CompareFunctions      .cp_a       ),
			.("RET NZ"               , (uint8)0, => JumpFunctions         .ret_nz     ),
			.("POP BC"               , (uint8)0, => StackFunctions        .pop_bc     ),
			.("JP NZ, u16"           , (uint8)2, => JumpFunctions         .jp_nz_nn   ),
			.("JP u16"               , (uint8)2, => JumpFunctions         .jp_nn      ),
			.("CALL NZ, u16"         , (uint8)2, => CallFunctions         .call_nz_nn ),
			.("PUSH BC"              , (uint8)0, => StackFunctions        .push_bc    ),
			.("ADD A, u8"            , (uint8)1, => AddFunctions          .add_a_n    ),
			.("RST 0x00"             , (uint8)0, => RstFunctions          .rst_00     ),
			.("RET Z"                , (uint8)0, => JumpFunctions         .ret_z      ),
			.("RET"                  , (uint8)0, => JumpFunctions         .ret        ),
			.("JP Z, u16"            , (uint8)2, => JumpFunctions         .jp_z_nn    ),
			.("CB %02X"              , (uint8)1, => CB                    .cb_n       ),
			.("CALL Z, u16"          , (uint8)2, => CallFunctions         .call_z_nn  ),
			.("CALL u16"             , (uint8)2, => CallFunctions         .call_nn    ),
			.("ADC u8"               , (uint8)1, => AdcFunctions          .adc_n      ),
			.("RST 0x08"             , (uint8)0, => RstFunctions          .rst_08     ),
			.("RET NC"               , (uint8)0, => JumpFunctions         .ret_nc     ),
			.("POP DE"               , (uint8)0, => StackFunctions        .pop_de     ),
			.("JP NC, u16"           , (uint8)2, => JumpFunctions         .jp_nc_nn   ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("CALL NC, u16"         , (uint8)2, => CallFunctions         .call_nc_nn ),
			.("PUSH DE"              , (uint8)0, => StackFunctions        .push_de    ),
			.("SUB u8"               , (uint8)1, => SubFunctions          .sub_n      ),
			.("RST 0x10"             , (uint8)0, => RstFunctions          .rst_10     ),
			.("RET C"                , (uint8)0, => JumpFunctions         .ret_c      ),
			.("RETI"                 , (uint8)0, => JumpFunctions         .reti       ),
			.("JP C, u16"            , (uint8)2, => JumpFunctions         .jp_c_nn    ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("CALL C, u16"          , (uint8)2, => CallFunctions         .call_c_nn  ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("SBC u8"               , (uint8)1, => SbcFunctions          .sbc_n      ),
			.("RST 0x18"             , (uint8)0, => RstFunctions          .rst_18     ),
			.("LD .(0xFF00 + u8), A" , (uint8)1, => LoadFunctions         .ld_On_a    ),
			.("POP HL"               , (uint8)0, => StackFunctions        .pop_hl     ),
			.("LD .(0xFF00 + C), A"  , (uint8)0, => LoadFunctions         .ld_Oc_a    ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("PUSH HL"              , (uint8)0, => StackFunctions        .push_hl    ),
			.("AND u8"               , (uint8)1, => BitwiseFunctions      .and_n      ),
			.("RST 0x20"             , (uint8)0, => RstFunctions          .rst_20     ),
			.("ADD SP,u8"            , (uint8)1, => AddFunctions          .add_sp_n   ),
			.("JP HL"                , (uint8)0, => JumpFunctions         .jp_hl      ),
			.("LD .(u16), A"         , (uint8)2, => LoadFunctions         .ld_nn_a    ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("XOR u8"               , (uint8)1, => BitwiseFunctions      .xor_n      ),
			.("RST 0x28"             , (uint8)0, => RstFunctions          .rst_28     ),
			.("LD A, .(0xFF00 + u8)" , (uint8)1, => LoadFunctions         .ld_a_On    ),
			.("POP AF"               , (uint8)0, => StackFunctions        .pop_af     ),
			.("LD A, .(0xFF00 + C)"  , (uint8)0, => LoadFunctions         .ld_a_Oc    ),
			.("DI"                   , (uint8)0, => MiscellaneousFunctions.di         ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("PUSH AF"              , (uint8)0, => StackFunctions        .push_af    ),
			.("OR u8"                , (uint8)1, => BitwiseFunctions      .or_n       ),
			.("RST 0x30"             , (uint8)0, => RstFunctions          .rst_30     ),
			.("LD HL, SP+u8"         , (uint8)1, => LoadFunctions         .ld_hl_spnn ),
			.("LD SP, HL"            , (uint8)0, => LoadFunctions         .ld_sp_hl   ),
			.("LD A, .(u16)"         , (uint8)2, => LoadFunctions         .ld_a_nn    ),
			.("EI"                   , (uint8)0, => MiscellaneousFunctions.ei         ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("UNKNOWN"              , (uint8)0, => nop                               ),
			.("CP u8"                , (uint8)1, => CompareFunctions      .cp_n       ),
			.("RST 0x38"             , (uint8)0, => RstFunctions          .rst_38     )
		);


		public static void nop(uint8 i = 0, uint16 i2 = 0)
		{
		}

		public static void undefined(uint8 i = 0, uint16 i2 = 0)
		{
			Log("Undefined instruction: ");
		}

		public this()
		{
			RAM = new Memory();
		}

		public static void DecodeAndRunInstruction(String name)
		{
		}

		//Step the CPU. This runs the current opcode at the program counter
		public void step()
		{
			//Gets the instruction at current pc and then increases pc by one.
			uint8 i = RAM[registers.pc++];
			uint16 operand = 0;

			if (instructions[i].operandLength == 1) operand = (uint16)cpu.RAM[registers.pc];
			else if (instructions[i].operandLength == 2) operand = cpu.RAM.read_short(registers.pc);

			if (i != 0xCB)
				Log(scope $"Running instruction {instructions[i].disassembly} (0x{i:x4}) with operand {operand:x4} @ PC = 0x{cpu.registers.pc-1:x4}\n");


			String RegisterString=scope $"a = 0x{registers.a:x2} b = 0x{registers.b:x2} c = 0x{registers.c:x2} d = 0x{registers.d:x2} e = 0x{registers.e:x2} h = 0x{registers.h:x2} l = 0x{registers.l:x2} af = 0x{registers.af:x4} bc = 0x{registers.bc:x4} de = 0x{registers.de:x4} hl = 0x{registers.hl:x4} sp = 0x{registers.sp:x4}\n";
			String Flags=scope $"z = {Utils.getBit(cpu.registers.flags,7)} s = {Utils.getBit(cpu.registers.flags,6)} hc = {Utils.getBit(cpu.registers.flags,5)} c = {Utils.getBit(cpu.registers.flags,4)}\n\n";

			Log(RegisterString);
			Log(Flags);
			

			registers.pc += instructions[i].operandLength;

			switch (instructions[i].operandLength) {
			case 0:	
				instructions[i].execute(0, 0);
				break;
			case 1:
				instructions[i].execute((uint8)operand, 0);
				break;
			case 2:
				instructions[i].execute(0, operand);
				break;
			}


		}
	}
}
