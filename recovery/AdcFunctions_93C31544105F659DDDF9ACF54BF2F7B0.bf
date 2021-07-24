
namespace BeefBoy.Emu.Instructions
{
	public static class AdcFunctions
	{
		public static void adc_a(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.a);
		}
		public static void adc_b(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.b);
		}
		public static void adc_c(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.c);
		}
		public static void adc_d(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.d);
		}
		public static void adc_e(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.e);
		}
		public static void adc_h(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.h);
		}
		public static void adc_l(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.registers.l);
		}
		public static void adc_hl(uint8 operand1,uint16 operand2)
		{
			Utils.adc(cpu.RAM[cpu.registers.hl]);
		}

		public static void adc_n(uint8 operand1,uint16 operand2)
		{
			Utils.adc(operand1);
		}

	}
}
