            .( "NOP"                  , (uint8)1, =>nop),
			.( "LD BC, u16"           , (uint8)2, =>undefined),
			.( "LD .(BC), A"          , (uint8)0, =>undefined),
			.( "INC BC"               , (uint8)0, =>InstructionFunctions.inc_bc),
			.( "INC B"                , (uint8)0, =>InstructionFunctions.inc_b),
			.( "DEC B"                , (uint8)0, =>InstructionFunctions.dec_b),
			.( "LD B, u8"             , (uint8)1, =>undefined),
			.( "RLCA"                 , (uint8)0, =>undefined),
			.( "LD .(u16), SP"        , (uint8)2, =>undefined),
			.( "ADD HL, BC"           , (uint8)0, =>undefined),
			.( "LD A, .(BC)"          , (uint8)0, =>undefined),
			.( "DEC BC"               , (uint8)0, =>InstructionFunctions.dec_bc),
			.( "INC C"                , (uint8)0, =>InstructionFunctions.inc_c),
			.( "DEC C"                , (uint8)0, =>InstructionFunctions.dec_c),
			.( "LD C, u8"             , (uint8)1, =>undefined),
			.( "RRCA"                 , (uint8)0, =>undefined),
			.( "STOP"                 , (uint8)1, =>undefined),
			.( "LD DE, u16"           , (uint8)2, =>undefined),
			.( "LD .(DE), A"          , (uint8)0, =>undefined),
			.( "INC DE"               , (uint8)0, =>InstructionFunctions.inc_de),
			.( "INC D"                , (uint8)0, =>InstructionFunctions.inc_d),
			.( "DEC D"                , (uint8)0, =>InstructionFunctions.dec_d),
			.( "LD D, u8"             , (uint8)1, =>undefined),
			.( "RLA"                  , (uint8)0, =>undefined),
			.( "JR u8"                , (uint8)1, =>undefined),
			.( "ADD HL, DE"           , (uint8)0, =>undefined),
			.( "LD A, .(DE)"          , (uint8)0, =>undefined),
			.( "DEC DE"               , (uint8)0, =>InstructionFunctions.dec_de),
			.( "INC E"                , (uint8)0, =>InstructionFunctions.inc_e),
			.( "DEC E"                , (uint8)0, =>InstructionFunctions.dec_e),
			.( "LD E, u8"             , (uint8)1, =>undefined),
			.( "RRA"                  , (uint8)0, =>undefined),
			.( "JR NZ, u8"            , (uint8)1, =>undefined),
			.( "LD HL, u16"           , (uint8)2, =>undefined),
			.( "LDI .(HL), A"         , (uint8)0, =>undefined),
			.( "INC HL"               , (uint8)0, =>InstructionFunctions.inc_hl),
			.( "INC H"                , (uint8)0, =>InstructionFunctions.inc_h),
			.( "DEC H"                , (uint8)0, =>InstructionFunctions.dec_h),
			.( "LD H, u8"             , (uint8)1, =>undefined),
			.( "DAA"                  , (uint8)0, =>undefined),
			.( "JR Z, u8"             , (uint8)1, =>undefined),
			.( "ADD HL, HL"           , (uint8)0, =>undefined),
			.( "LDI A, .(HL)"         , (uint8)0, =>undefined),
			.( "DEC HL"               , (uint8)0, =>InstructionFunctions.dec_hl),
			.( "INC L"                , (uint8)0, =>InstructionFunctions.inc_l),
			.( "DEC L"                , (uint8)0, =>InstructionFunctions.dec_l),
			.( "LD L, u8"             , (uint8)1, =>undefined),
			.( "CPL"                  , (uint8)0, =>undefined),
			.( "JR NC, u8"            , (uint8)1, =>undefined),
			.( "LD SP, u16"           , (uint8)2, =>InstructionFunctions.ld_sp_nn),
			.( "LDD .(HL), A"         , (uint8)0, =>undefined),
			.( "INC SP"               , (uint8)0, =>InstructionFunctions.inc_sp),
			.( "INC .(HL)"            , (uint8)0, =>InstructionFunctions.inc_hl),
			.( "DEC .(HL)"            , (uint8)0, =>InstructionFunctions.dec_hl),
			.( "LD .(HL), u8"         , (uint8)1, =>undefined),
			.( "SCF"                  , (uint8)0, =>undefined),
			.( "JR C, u8"             , (uint8)1, =>undefined),
			.( "ADD HL, SP"           , (uint8)0, =>undefined),
			.( "LDD A, .(HL)"         , (uint8)0, =>undefined),
			.( "DEC SP"               , (uint8)0, =>undefined),
			.( "INC A"                , (uint8)0, =>InstructionFunctions.inc_a),
			.( "DEC A"                , (uint8)0, =>InstructionFunctions.dec_a),
			.( "LD A, u8"             , (uint8)1, =>LoadFunctions.ld_a_n),
			.( "CCF"                  , (uint8)0, =>undefined),
			.( "LD B, B"              , (uint8)0, =>nop),
			.( "LD B, C"              , (uint8)0, =>LoadFunctions.ld_b_c),
			.( "LD B, D"              , (uint8)0, =>LoadFunctions.ld_b_d),
			.( "LD B, E"              , (uint8)0, =>LoadFunctions.ld_b_e),
			.( "LD B, H"              , (uint8)0, =>LoadFunctions.ld_b_h),
			.( "LD B, L"              , (uint8)0, =>LoadFunctions.ld_b_l),
			.( "LD B, .(HL)"          , (uint8)0, =>LoadFunctions.ld_b_hl),
			.( "LD B, A"              , (uint8)0, =>LoadFunctions.ld_b_a),
			.( "LD C, B"              , (uint8)0, =>LoadFunctions.ld_c_b),
			.( "LD C, C"              , (uint8)0, =>nop),
			.( "LD C, D"              , (uint8)0, =>InstructionFunctions.ld_c_d),
			.( "LD C, E"              , (uint8)0, =>InstructionFunctions.ld_c_e),
			.( "LD C, H"              , (uint8)0, =>InstructionFunctions.ld_c_h),
			.( "LD C, L"              , (uint8)0, =>InstructionFunctions.ld_c_l),
			.( "LD C, .(HL)"          , (uint8)0, =>InstructionFunctions.ld_c_hl),
			.( "LD C, A"              , (uint8)0, =>InstructionFunctions.ld_c_a),
			.( "LD D, B"              , (uint8)0, =>InstructionFunctions.ld_d_b),
			.( "LD D, C"              , (uint8)0, =>InstructionFunctions.ld_d_c),
			.( "LD D, D"              , (uint8)0, =>nop),
			.( "LD D, E"              , (uint8)0, =>InstructionFunctions.ld_d_e),
			.( "LD D, H"              , (uint8)0, =>InstructionFunctions.ld_d_h),
			.( "LD D, L"              , (uint8)0, =>InstructionFunctions.ld_d_l),
			.( "LD D, .(HL)"          , (uint8)0, =>InstructionFunctions.ld_d_hl),
			.( "LD D, A"              , (uint8)0, =>InstructionFunctions.ld_d_a),
			.( "LD E, B"              , (uint8)0, =>InstructionFunctions.ld_e_b),
			.( "LD E, C"              , (uint8)0, =>InstructionFunctions.ld_e_c),
			.( "LD E, D"              , (uint8)0, =>InstructionFunctions.ld_e_d),
			.( "LD E, E"              , (uint8)0, =>nop),
			.( "LD E, H"              , (uint8)0, =>InstructionFunctions.ld_e_h),
			.( "LD E, L"              , (uint8)0, =>InstructionFunctions.ld_e_l),
			.( "LD E, .(HL)"          , (uint8)0, =>InstructionFunctions.ld_e_hl),
			.( "LD E, A"              , (uint8)0, =>InstructionFunctions.ld_e_a),
			.( "LD H, B"              , (uint8)0, =>InstructionFunctions.ld_h_b),
			.( "LD H, C"              , (uint8)0, =>InstructionFunctions.ld_h_c),
			.( "LD H, D"              , (uint8)0, =>InstructionFunctions.ld_h_d),
			.( "LD H, E"              , (uint8)0, =>InstructionFunctions.ld_h_e),
			.( "LD H, H"              , (uint8)0, =>nop),
			.( "LD H, L"              , (uint8)0, =>InstructionFunctions.ld_h_l),
			.( "LD H, .(HL)"          , (uint8)0, =>InstructionFunctions.ld_h_hl),
			.( "LD H, A"              , (uint8)0, =>undefined),
			.( "LD L, B"              , (uint8)0, =>InstructionFunctions.ld_l_b),
			.( "LD L, C"              , (uint8)0, =>InstructionFunctions.ld_l_c),
			.( "LD L, D"              , (uint8)0, =>InstructionFunctions.ld_l_d),
			.( "LD L, E"              , (uint8)0, =>InstructionFunctions.ld_l_e),
			.( "LD L, H"              , (uint8)0, =>InstructionFunctions.ld_l_h),
			.( "LD L, L"              , (uint8)0, =>nop),
			.( "LD L, .(HL)"          , (uint8)0, =>InstructionFunctions.ld_l_hl),
			.( "LD L, A"              , (uint8)0, =>InstructionFunctions.ld_l_a),
			.( "LD .(HL), B"          , (uint8)0, =>InstructionFunctions.ld_hl_b),
			.( "LD .(HL), C"          , (uint8)0, =>InstructionFunctions.ld_hl_c),
			.( "LD .(HL), D"          , (uint8)0, =>InstructionFunctions.ld_hl_d),
			.( "LD .(HL), E"          , (uint8)0, =>InstructionFunctions.ld_hl_e),
			.( "LD .(HL), H"          , (uint8)0, =>InstructionFunctions.ld_hl_h),
			.( "LD .(HL), L"          , (uint8)0, =>InstructionFunctions.ld_hl_l),
			.( "HALT"                 , (uint8)0, =>InstructionFunctions.halt),
			.( "LD .(HL), A"          , (uint8)0, =>InstructionFunctions.ld_hl_a),
			.( "LD A, B"              , (uint8)0, =>InstructionFunctions.ld_a_b),
			.( "LD A, C"              , (uint8)0, =>InstructionFunctions.ld_a_c),
			.( "LD A, D"              , (uint8)0, =>InstructionFunctions.ld_a_d),
			.( "LD A, E"              , (uint8)0, =>InstructionFunctions.ld_a_e),
			.( "LD A, H"              , (uint8)0, =>InstructionFunctions.ld_a_h),
			.( "LD A, L"              , (uint8)0, =>InstructionFunctions.ld_a_l),
			.( "LD A, .(HL)"          , (uint8)0, =>InstructionFunctions.ld_a_hl),
			.( "LD A, A"              , (uint8)0, =>nop),
			.( "ADD A, B"             , (uint8)0, =>InstructionFunctions.add_a_b),
			.( "ADD A, C"             , (uint8)0, =>InstructionFunctions.add_a_c),
			.( "ADD A, D"             , (uint8)0, =>InstructionFunctions.add_a_d),
			.( "ADD A, E"             , (uint8)0, =>InstructionFunctions.add_a_e),
			.( "ADD A, H"             , (uint8)0, =>InstructionFunctions.add_a_h),
			.( "ADD A, L"             , (uint8)0, =>InstructionFunctions.add_a_l),
			.( "ADD A, .(HL)"         , (uint8)0, =>InstructionFunctions.add_a_hl),
			.( "ADD A"                , (uint8)0, =>InstructionFunctions.add_a_a),
			.( "ADC C"                , (uint8)0, =>InstructionFunctions.adc_c),
			.( "ADC B"                , (uint8)0, =>InstructionFunctions.adc_b),
			.( "ADC D"                , (uint8)0, =>InstructionFunctions.adc_d),
			.( "ADC E"                , (uint8)0, =>InstructionFunctions.adc_e),
			.( "ADC H"                , (uint8)0, =>InstructionFunctions.adc_h),
			.( "ADC L"                , (uint8)0, =>InstructionFunctions.adc_l),
			.( "ADC .(HL)"            , (uint8)0, =>InstructionFunctions.adc_hl),
			.( "ADC A"                , (uint8)0, =>InstructionFunctions.adc_a),
			.( "SUB B"                , (uint8)0, =>InstructionFunctions.sub_b),
			.( "SUB C"                , (uint8)0, =>InstructionFunctions.sub_c),
			.( "SUB D"                , (uint8)0, =>InstructionFunctions.sub_d),
			.( "SUB E"                , (uint8)0, =>InstructionFunctions.sub_e),
			.( "SUB H"                , (uint8)0, =>InstructionFunctions.sub_h),
			.( "SUB L"                , (uint8)0, =>InstructionFunctions.sub_l),
			.( "SUB .(HL)"            , (uint8)0, =>InstructionFunctions.sub_hl),
			.( "SUB A"                , (uint8)0, =>InstructionFunctions.sub_a),
			.( "SBC B"                , (uint8)0, =>InstructionFunctions.sbc_b),
			.( "SBC C"                , (uint8)0, =>InstructionFunctions.sbc_c),
			.( "SBC D"                , (uint8)0, =>InstructionFunctions.sbc_d),
			.( "SBC E"                , (uint8)0, =>InstructionFunctions.sbc_e),
			.( "SBC H"                , (uint8)0, =>InstructionFunctions.sbc_h),
			.( "SBC L"                , (uint8)0, =>InstructionFunctions.sbc_l),
			.( "SBC .(HL)"            , (uint8)0, =>InstructionFunctions.sbc_hl),
			.( "SBC A"                , (uint8)0, =>InstructionFunctions.sbc_a),
			.( "AND C"                , (uint8)0, =>InstructionFunctions.and_c),
			.( "AND D"                , (uint8)0, =>InstructionFunctions.and_d),
			.( "AND B"                , (uint8)0, =>InstructionFunctions.and_b),
			.( "AND E"                , (uint8)0, =>InstructionFunctions.and_e),
			.( "AND H"                , (uint8)0, =>InstructionFunctions.and_h),
			.( "AND L"                , (uint8)0, =>InstructionFunctions.and_l),
			.( "AND .(HL)"            , (uint8)0, =>InstructionFunctions.and_hl),
			.( "AND A"                , (uint8)0, =>InstructionFunctions.and_a),
			.( "XOR C"                , (uint8)0, =>InstructionFunctions.xor_c),
			.( "XOR B"                , (uint8)0, =>InstructionFunctions.xor_b),
			.( "XOR D"                , (uint8)0, =>InstructionFunctions.xor_d),
			.( "XOR E"                , (uint8)0, =>InstructionFunctions.xor_e),
			.( "XOR H"                , (uint8)0, =>InstructionFunctions.xor_h),
			.( "XOR L"                , (uint8)0, =>InstructionFunctions.xor_l),
			.( "XOR .(HL)"            , (uint8)0, =>InstructionFunctions.xor_hl),
			.( "XOR A"                , (uint8)0, =>InstructionFunctions.xor_a),
			.( "OR B"                 , (uint8)0, =>InstructionFunctions.or_b),
			.( "OR C"                 , (uint8)0, =>InstructionFunctions.or_c),
			.( "OR D"                 , (uint8)0, =>InstructionFunctions.or_d),
			.( "OR E"                 , (uint8)0, =>InstructionFunctions.or_e),
			.( "OR H"                 , (uint8)0, =>InstructionFunctions.or_h),
			.( "OR L"                 , (uint8)0, =>InstructionFunctions.or_l),
			.( "OR .(HL)"             , (uint8)0, =>InstructionFunctions.or_hl),
			.( "OR A"                 , (uint8)0, =>InstructionFunctions.or_a),
			.( "CP B"                 , (uint8)0, =>undefined),
			.( "CP C"                 , (uint8)0, =>undefined),
			.( "CP D"                 , (uint8)0, =>undefined),
			.( "CP E"                 , (uint8)0, =>undefined),
			.( "CP H"                 , (uint8)0, =>undefined),
			.( "CP L"                 , (uint8)0, =>undefined),
			.( "CP .(HL)"             , (uint8)0, =>undefined),
			.( "CP A"                 , (uint8)0, =>undefined),
			.( "RET NZ"               , (uint8)0, =>undefined),
			.( "POP BC"               , (uint8)0, =>undefined),
			.( "JP NZ, u16"           , (uint8)2, =>undefined),
			.( "JP u16"               , (uint8)2, =>undefined),
			.( "CALL NZ, u16"         , (uint8)2, =>undefined),
			.( "PUSH BC"              , (uint8)0, =>undefined),
			.( "ADD A, u8"            , (uint8)1, =>undefined),
			.( "RST 0x00"             , (uint8)0, =>undefined),
			.( "RET Z"                , (uint8)0, =>undefined),
			.( "RET"                  , (uint8)0, =>undefined),
			.( "JP Z, u16"            , (uint8)2, =>undefined),
			.( "CB %02X"              , (uint8)1, =>undefined),
			.( "CALL Z, u16"          , (uint8)2, =>undefined),
			.( "CALL u16"             , (uint8)2, =>undefined),
			.( "ADC u8"               , (uint8)1, =>undefined),
			.( "RST 0x08"             , (uint8)0, =>undefined),
			.( "RET NC"               , (uint8)0, =>undefined),
			.( "POP DE"               , (uint8)0, =>undefined),
			.( "JP NC, u16"           , (uint8)2, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>undefined),
			.( "CALL NC, u16"         , (uint8)2, =>undefined),
			.( "PUSH DE"              , (uint8)0, =>undefined),
			.( "SUB u8"               , (uint8)1, =>undefined),
			.( "RST 0x10"             , (uint8)0, =>undefined),
			.( "RET C"                , (uint8)0, =>undefined),
			.( "RETI"                 , (uint8)0, =>undefined),
			.( "JP C, u16"            , (uint8)2, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "CALL C, u16"          , (uint8)2, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "SBC u8"               , (uint8)1, =>undefined),
			.( "RST 0x18"             , (uint8)0, =>undefined),
			.( "LD .(0xFF00 + u8), A" , (uint8)1, =>undefined),
			.( "POP HL"               , (uint8)0, =>undefined),
			.( "LD .(0xFF00 + C), A"  , (uint8)0, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "PUSH HL"              , (uint8)0, =>undefined),
			.( "AND u8"               , (uint8)1, =>undefined),
			.( "RST 0x20"             , (uint8)0, =>undefined),
			.( "ADD SP,u8"            , (uint8)1, =>undefined),
			.( "JP HL"                , (uint8)0, =>undefined),
			.( "LD .(u16), A"         , (uint8)2, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "XOR u8"               , (uint8)1, =>undefined),
			.( "RST 0x28"             , (uint8)0, =>undefined),
			.( "LD A, .(0xFF00 + u8)" , (uint8)1, =>undefined),
			.( "POP AF"               , (uint8)0, =>undefined),
			.( "LD A, .(0xFF00 + C)"  , (uint8)0, =>undefined),
			.( "DI"                   , (uint8)0, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "PUSH AF"              , (uint8)0, =>undefined),
			.( "OR u8"                , (uint8)1, =>undefined),
			.( "RST 0x30"             , (uint8)0, =>undefined),
			.( "LD HL, SP+u8"         , (uint8)1, =>undefined),
			.( "LD SP, HL"            , (uint8)0, =>undefined),
			.( "LD A, .(u16)"         , (uint8)2, =>undefined),
			.( "EI"                   , (uint8)0, =>undefined),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "UNKNOWN"              , (uint8)0, =>nop),
			.( "CP u8"                , (uint8)1, =>undefined),
			.( "RST 0x38"             , (uint8)0, =>InstructionFunctions.rst_38)  