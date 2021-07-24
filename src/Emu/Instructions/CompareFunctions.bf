namespace BeefBoy.Emu.Instructions
{
	public static class CompareFunctions
	{
		public static void cp_a(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.a);
		}
		public static void cp_b(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.b);
		}
		public static void cp_c(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.c);
		}
		public static void cp_d(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.d);
		}
		public static void cp_e(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.e);
		}
		public static void cp_h(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.h);
		}
		public static void cp_l(uint8 operand1, uint16 operand2){
			Utils.cp(cpu.registers.l);
		}
		public static void cp_n(uint8 operand1, uint16 operand2){
			Utils.cp(operand1);
		}
		public static void cp_hl(uint8 operand1, uint16 operand2)
		{
			Utils.cp(cpu.RAM[cpu.registers.hl]);
		}
	}
}
