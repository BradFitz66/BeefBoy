namespace BeefBoy.Emu.Instructions
{

	/*

	*/
	public static class LoadFunctions
	{
		public static void ld_sp_nn(uint8 operand1,uint16 operand2)
		{
		    cpu.registers.sp=operand2;
		}

		public static void ld_a_n(uint8 param, uint16 param2)
		{
			cpu.registers.a=param;
		}
		public static void ld_a_b(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.registers.b;
		}
		public static void ld_a_c(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.registers.c;
		}
		public static void ld_a_d(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.registers.d;
		}
		public static void ld_a_e(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.registers.e;
		}
		public static void ld_a_h(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.registers.h;
		}
		public static void ld_a_l(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.registers.l;
		}

		public static void ld_a_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.a = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_b_a(uint8 operand1, uint16 operand2)
		{
			cpu.registers.b = cpu.registers.a;
		}
		public static void ld_b_c(uint8 operand1, uint16 operand2)
		{
			cpu.registers.b = cpu.registers.c;
		}
		public static void ld_b_d(uint8 operand1, uint16 operand2)
		{
			cpu.registers.b = cpu.registers.d;
		}
		public static void ld_b_e(uint8 operand1, uint16 operand2)
		{
			cpu.registers.b = cpu.registers.e;
		}
		public static void ld_b_h(uint8 operand1, uint16 operand2)
		{
			cpu.registers.b = cpu.registers.h;
		}
		public static void ld_b_l(uint8 operand1, uint16 operand2)
		{
			cpu.registers.b = cpu.registers.l;
		}

		public static void ld_b_hl(uint8 param, uint16 param2)
		{
			cpu.registers.b=cpu.RAM[cpu.registers.hl];
		}

		public static void ld_c_a(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.registers.a;
		}
		public static void ld_c_b(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.registers.b;
		}
		public static void ld_c_d(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.registers.d;
		}
		public static void ld_c_e(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.registers.e;
		}
		public static void ld_c_h(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.registers.h;
		}
		public static void ld_c_l(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.registers.l;
		}

		public static void ld_c_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.c = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_d_a(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.registers.a;
		}
		public static void ld_d_b(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.registers.b;
		}
		public static void ld_d_c(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.registers.c;
		}
		public static void ld_d_e(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.registers.e;
		}
		public static void ld_d_h(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.registers.h;
		}
		public static void ld_d_l(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.registers.l;
		}

		public static void ld_d_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.d = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_e_a(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.registers.a;
		}
		public static void ld_e_b(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.registers.b;
		}
		public static void ld_e_c(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.registers.c;
		}
		public static void ld_e_d(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.registers.d;
		}
		public static void ld_e_h(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.registers.h;
		}
		public static void ld_e_l(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.registers.l;
		}
		public static void ld_e_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.e = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_h_a(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.registers.a;
		}
		public static void ld_h_b(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.registers.b;
		}
		public static void ld_h_c(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.registers.c;
		}
		public static void ld_h_e(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.registers.e;
		}
		public static void ld_h_d(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.registers.d;
		}
		public static void ld_h_l(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.registers.l;
		}

		public static void ld_h_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.h = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_l_a(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.registers.a;
		}
		public static void ld_l_b(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.registers.b;
		}
		public static void ld_l_c(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.registers.c;
		}
		public static void ld_l_e(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.registers.e;
		}
		public static void ld_l_h(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.registers.h;
		}
		public static void ld_l_d(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.registers.d;
		}

		public static void ld_l_hl(uint8 operand1, uint16 operand2)
		{
			cpu.registers.l = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_hl_b(uint8 operand1, uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl] = cpu.registers.b;
		}

		public static void ld_hl_c(uint8 operand1, uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl] = cpu.registers.c;
		}

		public static void ld_hl_e(uint8 operand1, uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl] = cpu.registers.e;
		}

		public static void ld_hl_d(uint8 operand1, uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl] = cpu.registers.d;
		}

		public static void ld_hl_h(uint8 operand1, uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl] = cpu.registers.h;
		}

		public static void ld_hl_l(uint8 operand1, uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl] = cpu.registers.l;
		}
		public static void ld_hl_a(uint8 operand1, uint16 operand2 )
		{
			cpu.RAM[cpu.registers.hl] = cpu.registers.a;
		}

		public static void ld_hl_nn(uint8 operand1, uint16 operand2 )
		{
			cpu.registers.hl = operand2;
		}

		public static void ld_de_nn(uint8 operand1,uint16 operand2)
		{
		    cpu.registers.de=operand2;
		}

		public static void ld_bc_nn(uint8 operand1,uint16 operand2)
		{
		    cpu.registers.bc=operand2;
		}

		public static void ldd_hl_a(uint8 operand1,uint16 operand2)
		{
		    cpu.RAM[cpu.registers.hl]=cpu.registers.a;
			cpu.registers.hl--;
		}
		public static void ldi_hl_a(uint8 operand1,uint16 operand2)
		{
		    cpu.registers.a=cpu.RAM[cpu.registers.hl];
			cpu.registers.hl++;
		}

		public static void ld_On_a(uint8 param, uint16 param2)
		{
			cpu.RAM[0xFF00+param]=cpu.registers.a;
		}

		public static void ld_Oc_a(uint8 param, uint16 param2)
		{
			cpu.RAM[0xFF00+cpu.registers.c]=cpu.registers.a;
		}

		public static void ld_nn_a(uint8 param, uint16 param2)
		{
			cpu.RAM[param2]=cpu.registers.a;
		}

		public static void ld_a_On(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[0xFF00+param];
		}

		public static void ld_a_Oc(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[0xFF00+cpu.registers.c];
		}

		public static void ld_hl_spn(uint8 param, uint16 param2)
		{
			cpu.registers.hl=cpu.registers.sp+param;
		}

		public static void ld_sp_hl(uint8 param, uint16 param2)
		{
			cpu.registers.sp=cpu.registers.hl;
		}

		public static void ld_a_nn(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[param2];
		}

		public static void ldd_a_hl(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[cpu.registers.hl];
			cpu.registers.hl--;
		}

		public static void ld_hl_n(uint8 param, uint16 param2)
		{
			cpu.RAM[cpu.registers.hl]=param;
		}

		public static void ldi_a_hl(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[cpu.registers.hl];
			cpu.registers.hl++;
		}

		public static void ld_h_n(uint8 param, uint16 param2)
		{
			cpu.registers.h=param;
		}

		public static void ld_e_n(uint8 param, uint16 param2)
		{
			cpu.registers.e=param;
		}

		public static void ld_a_de(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[cpu.registers.de];
		}

		public static void ld_de_a(uint8 param, uint16 param2)
		{
			cpu.RAM[cpu.registers.de]=cpu.registers.a;
		}

		public static void ld_nn_sp(uint8 param, uint16 param2)
		{
			cpu.registers.sp=param2;
		}

		public static void ld_bc_a(uint8 param, uint16 param2)
		{
			cpu.RAM[cpu.registers.bc]=cpu.registers.a;
		}

		public static void ld_hl_spnn(uint8 param, uint16 param2)
		{
			cpu.registers.hl=cpu.registers.sp+param2;
		}

		public static void ld_d_n(uint8 param, uint16 param2)
		{
			cpu.registers.d=param;
		}

		public static void ld_c_n(uint8 param, uint16 param2)
		{
			cpu.registers.c=param;
		}

		public static void ld_a_bc(uint8 param, uint16 param2)
		{
			cpu.registers.a=cpu.RAM[cpu.registers.bc];
		}

		public static void ld_b_n(uint8 param, uint16 param2)
		{
			cpu.registers.b=param;
		}

		public static void ld_l_n(uint8 param, uint16 param2)
		{
			cpu.registers.l=param;
		}
	}
}
