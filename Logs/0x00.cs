namespace BeefBoy.Emu.Instructions
{

	/*
	Due to the lack of code folding support in the beef IDE, 8bit've resorted to putting instructions into their own classes. Here, you'll find all load instruction functions.

	Please, person who's making beef, add code folding support.
	*/
	public static class LoadFunctions
	{



		public static void ld_a_n(uint8 operand1, uint16 operand2)
		{
            cpu.registers.a=operand1;
		}
		public static void ld_a_b(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.registers.b;
		}
		public static void ld_a_c(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.registers.c;
		}
		public static void ld_a_d(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.registers.d;
		}
		public static void ld_a_e(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.registers.e;
		}
		public static void ld_a_h(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.registers.h;
		}
		public static void ld_a_l(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.registers.l;
		}

		public static void ld_a_hl(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.a = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_b_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.b = cpu.registers.a;
		}
		public static void ld_b_c(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.b = cpu.registers.c;
		}
		public static void ld_b_d(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.b = cpu.registers.d;
		}
		public static void ld_b_e(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.b = cpu.registers.e;
		}
		public static void ld_b_h(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.b = cpu.registers.h;
		}
		public static void ld_b_l(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.b = cpu.registers.l;
		}

		public static void ld_b_hl(uint8 operand1, uint16 operand2)
		{
            cpu.registers.b=cpu.RAM[cpu.registers.hl]
		}

		public static void ld_c_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.registers.a;
		}
		public static void ld_c_b(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.registers.b;
		}
		public static void ld_c_d(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.registers.d;
		}
		public static void ld_c_e(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.registers.e;
		}
		public static void ld_c_h(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.registers.h;
		}
		public static void ld_c_l(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.registers.l;
		}

		public static void ld_c_hl(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.c = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_d_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.registers.a;
		}
		public static void ld_d_b(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.registers.b;
		}
		public static void ld_d_c(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.registers.c;
		}
		public static void ld_d_e(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.registers.e;
		}
		public static void ld_d_h(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.registers.h;
		}
		public static void ld_d_l(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.registers.l;
		}

		public static void ld_d_hl(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.d = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_e_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.registers.a;
		}
		public static void ld_e_b(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.registers.b;
		}
		public static void ld_e_c(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.registers.c;
		}
		public static void ld_e_d(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.registers.d;
		}
		public static void ld_e_h(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.registers.h;
		}
		public static void ld_e_l(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.registers.l;
		}
		public static void ld_e_hl(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.e = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_h_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.registers.a;
		}
		public static void ld_h_b(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.registers.b;
		}
		public static void ld_h_c(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.registers.c;
		}
		public static void ld_h_e(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.registers.e;
		}
		public static void ld_h_d(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.registers.d;
		}
		public static void ld_h_l(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.registers.l;
		}

		public static void ld_h_hl(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.h = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_l_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.registers.a;
		}
		public static void ld_l_b(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.registers.b;
		}
		public static void ld_l_c(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.registers.c;
		}
		public static void ld_l_e(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.registers.e;
		}
		public static void ld_l_h(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.registers.h;
		}
		public static void ld_l_d(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.registers.d;
		}

		public static void ld_l_hl(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.registers.l = cpu.RAM[cpu.registers.hl];
		}

		public static void ld_hl_b(uint8 operand1, uint16 operand2)
		{
            cpu.RAM[cpu.registers.hl] = cpu.registers.b
		}

		public static void ld_hl_c(uint8 operand1, uint16 operand2)
		{
            cpu.RAM[cpu.registers.hl] = cpu.registers.c
		}

		public static void ld_hl_e(uint8 operand1, uint16 operand2)
		{
            cpu.RAM[cpu.registers.hl] = cpu.registers.e
		}

		public static void ld_hl_d(uint8 operand1, uint16 operand2)
		{
            cpu.RAM[cpu.registers.hl] = cpu.registers.d
		}

		public static void ld_hl_h(uint8 operand1, uint16 operand2)
		{
            cpu.RAM[cpu.registers.hl] = cpu.registers.h
		}

		public static void ld_hl_l(uint8 operand1, uint16 operand2)
		{
            cpu.RAM[cpu.registers.hl] = cpu.registers.l
		}
		public static void ld_hl_a(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.RAM[cpu.registers.hl] = cpu.registers.a;
		}
        public static void ld_hl_nn(uint8 operand1 = 0, uint16 operand2 = 0)
		{
			cpu.RAM[cpu.registers.hl] = operand2;
		}

        public static void ld_sp_nn(uint8 operand1=0,uint16 operand2=0)
		{
		    cpu.registers.sp=operand2;
		}

        public static void ld_de_nn(uint8 operand1=0,uint16 operand2=0)
		{
		    cpu.registers.de=operand2;
		}

        public static void ld_bc_nn(uint8 operand1=0,uint16 operand2=0)
		{
		    cpu.registers.bc=operand2;
		}

	}
}
