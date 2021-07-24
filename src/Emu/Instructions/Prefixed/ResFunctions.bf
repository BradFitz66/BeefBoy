namespace BeefBoy.Emu.Instructions.Prefixed
{
	public static class ResFunctions
	{
		public static void res_0_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,0);
		}
		public static void res_0_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,0);
		}
		public static void res_0_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,0);
		}
		public static void res_0_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,0);
		}
		public static void res_0_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,0);
		}
		public static void res_0_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,0);
		}
		public static void res_0_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,0);

			cpu.registers.hl=hl;
		}
		public static void res_0_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,0);
		}
		public static void res_1_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,1);
		}
		public static void res_1_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,1);
		}
		public static void res_1_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,1);
		}
		public static void res_1_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,1);
		}
		public static void res_1_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,1);
		}
		public static void res_1_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,1);
		}
		public static void res_1_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,1);

			cpu.registers.hl=hl;
		}
		public static void res_1_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,1);
		}
		public static void res_2_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,2);
		}
		public static void res_2_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,2);
		}
		public static void res_2_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,2);
		}
		public static void res_2_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,2);
		}
		public static void res_2_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,2);
		}
		public static void res_2_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,2);
		}
		public static void res_2_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,2);

			cpu.registers.hl=hl;
		}
		public static void res_2_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,2);
		}
		public static void res_3_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,3);
		}
		public static void res_3_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,3);
		}
		public static void res_3_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,3);
		}
		public static void res_3_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,3);
		}
		public static void res_3_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,3);
		}
		public static void res_3_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,3);
		}
		public static void res_3_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,3);

			cpu.registers.hl=hl;
		}
		public static void res_3_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,3);
		}
		public static void res_4_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,4);
		}
		public static void res_4_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,4);
		}
		public static void res_4_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,4);
		}
		public static void res_4_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,4);
		}
		public static void res_4_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,4);
		}
		public static void res_4_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,4);
		}
		public static void res_4_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,4);

			cpu.registers.hl=hl;
		}
		public static void res_4_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,4);
		}
		public static void res_5_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,5);
		}
		public static void res_5_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,5);
		}
		public static void res_5_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,5);
		}
		public static void res_5_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,5);
		}
		public static void res_5_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,5);
		}
		public static void res_5_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,5);
		}
		public static void res_5_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,5);

			cpu.registers.hl=hl;
		}
		public static void res_5_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,5);
		}
		public static void res_6_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,6);
		}
		public static void res_6_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,6);
		}
		public static void res_6_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,6);
		}
		public static void res_6_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,6);
		}
		public static void res_6_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,6);
		}
		public static void res_6_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,6);
		}
		public static void res_6_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,6);

			cpu.registers.hl=hl;
		}
		public static void res_6_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,6);
		}
		public static void res_7_b(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.b,7);
		}
		public static void res_7_c(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.c,7);
		}
		public static void res_7_d(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.d,7);
		}
		public static void res_7_e(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.e,7);
		}
		public static void res_7_h(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.h,7);
		}
		public static void res_7_l(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.l,7);
		}
		public static void res_7_hl(uint8 operand1, uint16 operand2){
			uint16 hl=cpu.registers.hl;

			Utils.ResetBit(ref hl,7);

			cpu.registers.hl=hl;
		}
		public static void res_7_a(uint8 operand1, uint16 operand2){
		    Utils.ResetBit(ref cpu.registers.a,7);
		}
	}
}
