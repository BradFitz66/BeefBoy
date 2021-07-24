namespace BeefBoy.Emu.Instructions.Prefixed
{
	public static class BitShiftFunctions
	{
		public static void rlc_c(uint8 operand1, uint16 operand2){
		    Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_b(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_d(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_e(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_h(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_l(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_hl(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}
		public static void rlc_a(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.left,ref cpu.registers.c,1);
		}


		public static void rrc_b(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_c(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_d(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_e(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_h(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_l(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_hl(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}
		public static void rrc_a(uint8 operand1, uint16 operand2){
			Utils.rotate_register(.right,ref cpu.registers.c,1);
		}


		public static void rl_b(uint8 operand1, uint16 operand2){

		}
		public static void rl_c(uint8 operand1, uint16 operand2){

		}
		public static void rl_d(uint8 operand1, uint16 operand2){

		}
		public static void rl_e(uint8 operand1, uint16 operand2){

		}
		public static void rl_h(uint8 operand1, uint16 operand2){

		}
		public static void rl_l(uint8 operand1, uint16 operand2){

		}
		public static void rl_hl(uint8 operand1, uint16 operand2){

		}
		public static void rl_a(uint8 operand1, uint16 operand2){

		}


		public static void rr_b(uint8 operand1, uint16 operand2){

		}
		public static void rr_c(uint8 operand1, uint16 operand2){

		}
		public static void rr_d(uint8 operand1, uint16 operand2){

		}
		public static void rr_e(uint8 operand1, uint16 operand2){

		}
		public static void rr_h(uint8 operand1, uint16 operand2){

		}
		public static void rr_l(uint8 operand1, uint16 operand2){

		}
		public static void rr_hl(uint8 operand1, uint16 operand2){

		}
		public static void rr_a(uint8 operand1, uint16 operand2){

		}

		public static void sla_b(uint8 operand1, uint16 operand2){

		}
		public static void sla_c(uint8 operand1, uint16 operand2){

		}
		public static void sla_d(uint8 operand1, uint16 operand2){

		}
		public static void sla_e(uint8 operand1, uint16 operand2){

		}
		public static void sla_h(uint8 operand1, uint16 operand2){

		}
		public static void sla_l(uint8 operand1, uint16 operand2){

		}
		public static void sla_hl(uint8 operand1, uint16 operand2){

		}
		public static void sla_a(uint8 operand1, uint16 operand2){

		}


		public static void sra_b(uint8 operand1, uint16 operand2){

		}
		public static void sra_c(uint8 operand1, uint16 operand2){

		}
		public static void sra_d(uint8 operand1, uint16 operand2){

		}
		public static void sra_e(uint8 operand1, uint16 operand2){

		}
		public static void sra_h(uint8 operand1, uint16 operand2){

		}
		public static void sra_l(uint8 operand1, uint16 operand2){

		}
		public static void sra_hl(uint8 operand1, uint16 operand2){

		}
		public static void sra_a(uint8 operand1, uint16 operand2){

		}


		public static void srl_b(uint8 operand1, uint16 operand2){

		}
		public static void srl_c(uint8 operand1, uint16 operand2){

		}
		public static void srl_d(uint8 operand1, uint16 operand2){

		}
		public static void srl_e(uint8 operand1, uint16 operand2){

		}
		public static void srl_h(uint8 operand1, uint16 operand2){

		}
		public static void srl_l(uint8 operand1, uint16 operand2){

		}
		public static void srl_hl(uint8 operand1, uint16 operand2){

		}
		public static void srl_a(uint8 operand1, uint16 operand2){

		}
	}
}
