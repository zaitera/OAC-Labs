/* **************************************************** */
/* * Escolha o tipo de processador a ser implementado * */
`define UNICICLO
//`define MULTICICLO 
//`define PIPELINE


/* **************************************************** */
/* * Escolha a ISA a ser implementada                 * */
//`define RV32I
`define RV32IM
//`define RV32IMF


// Define se será utilizado simulação ou síntese (não sintetiza dispositivos de IO)
//`define SIMULACAO

`ifndef PARAM
	`include "Parametros.v"
`endif

/*   ******************  Historico ***********************
	Colocar os nomes e matriculas dos autores



 Adaptado para a placa de desenvolvimento DE1-SoC.
 Prof. Marcus Vinicius Lamar   2018/1
 UnB - Universidade de Brasilia
 Dep. Ciencia da Computacao

 */
 
//`define ENABLE_HPS

module TopDE (
      ///////// ADC Analog-Digital Converter/////////
      inout              ADC_CS_N,
      output             ADC_DIN,
      input              ADC_DOUT,
      output             ADC_SCLK,

      ///////// AUD Audio Codec /////////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK2 /////////
      input              CLOCK2_50,

      ///////// CLOCK3 /////////
      input              CLOCK3_50,

      ///////// CLOCK4 /////////
      input              CLOCK4_50,

      ///////// CLOCK /////////
      input              CLOCK_50,

      ///////// DRAM Syncronous Dynamic RAM/////////
      output      [12:0] DRAM_ADDR,
      output      [1:0]  DRAM_BA,
      output             DRAM_CAS_N,
      output             DRAM_CKE,
      output             DRAM_CLK,
      output             DRAM_CS_N,
      inout       [15:0] DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_RAS_N,
      output             DRAM_UDQM,
      output             DRAM_WE_N,

      ///////// FAN /////////
      output             FAN_CTRL,

      ///////// FPGA I2C controler /////////
      output             FPGA_I2C_SCLK,
      inout              FPGA_I2C_SDAT,

      ///////// GPIO Generic Paralel I/O/////////
      inout     [35:0]         GPIO_0,
      inout     [35:0]         GPIO_1,
 

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,

      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// HEX4 /////////
      output      [6:0]  HEX4,

      ///////// HEX5 /////////
      output      [6:0]  HEX5,

`ifdef ENABLE_HPS
      ///////// HPS - Hard Processor System  ARMv7/////////
      inout              HPS_CONV_USB_N,
      output      [14:0] HPS_DDR3_ADDR,
      output      [2:0]  HPS_DDR3_BA,
      output             HPS_DDR3_CAS_N,
      output             HPS_DDR3_CKE,
      output             HPS_DDR3_CK_N,
      output             HPS_DDR3_CK_P,
      output             HPS_DDR3_CS_N,
      output      [3:0]  HPS_DDR3_DM,
      inout       [31:0] HPS_DDR3_DQ,
      inout       [3:0]  HPS_DDR3_DQS_N,
      inout       [3:0]  HPS_DDR3_DQS_P,
      output             HPS_DDR3_ODT,
      output             HPS_DDR3_RAS_N,
      output             HPS_DDR3_RESET_N,
      input              HPS_DDR3_RZQ,
      output             HPS_DDR3_WE_N,
      output             HPS_ENET_GTX_CLK,
      inout              HPS_ENET_INT_N,
      output             HPS_ENET_MDC,
      inout              HPS_ENET_MDIO,
      input              HPS_ENET_RX_CLK,
      input       [3:0]  HPS_ENET_RX_DATA,
      input              HPS_ENET_RX_DV,
      output      [3:0]  HPS_ENET_TX_DATA,
      output             HPS_ENET_TX_EN,
      inout       [3:0]  HPS_FLASH_DATA,
      output             HPS_FLASH_DCLK,
      output             HPS_FLASH_NCSO,
      inout              HPS_GSENSOR_INT,
      inout              HPS_I2C1_SCLK,
      inout              HPS_I2C1_SDAT,
      inout              HPS_I2C2_SCLK,
      inout              HPS_I2C2_SDAT,
      inout              HPS_I2C_CONTROL,
      inout              HPS_KEY,
      inout              HPS_LED,
      inout              HPS_LTC_GPIO,
      output             HPS_SD_CLK,
      inout              HPS_SD_CMD,
      inout       [3:0]  HPS_SD_DATA,
      output             HPS_SPIM_CLK,
      input              HPS_SPIM_MISO,
      output             HPS_SPIM_MOSI,
      inout              HPS_SPIM_SS,
      input              HPS_UART_RX,
      output             HPS_UART_TX,
      input              HPS_USB_CLKOUT,
      inout       [7:0]  HPS_USB_DATA,
      input              HPS_USB_DIR,
      input              HPS_USB_NXT,
      output             HPS_USB_STP,
`endif /*ENABLE_HPS*/

      ///////// IRDA InfraRed Data Associaton /////////
      input              IRDA_RXD,
      output             IRDA_TXD,

      ///////// KEY Push-Bottom /////////
      input       [3:0]  KEY,

      ///////// LEDR  LED Red/////////
      output      [9:0]  LEDR,

      ///////// PS2 Interface /////////
      inout              PS2_CLK,
      inout              PS2_CLK2,
      inout              PS2_DAT,
      inout              PS2_DAT2,

      ///////// SW  Switches /////////
      input       [9:0]  SW,

      ///////// TD  TV Decoder /////////
      input              TD_CLK27,
      input      [7:0]  TD_DATA,
      input             TD_HS,
      output             TD_RESET_N,
      input             TD_VS,

      ///////// VGA Interface /////////
      output      [7:0]  VGA_B,
      output             VGA_BLANK_N,
      output             VGA_CLK,
      output      [7:0]  VGA_G,
      output             VGA_HS,
      output      [7:0]  VGA_R,
      output             VGA_SYNC_N,
      output             VGA_VS
		
		
`ifdef SIMULACAO
    ,						// Nao retirar esta virgula !!!!!
    output          MClock, Clock25, Clock50, Clock100,
    output  [31:0]  PC, 
	 output  [31:0]  Instrucao,
    output  [31:0]  BR_Leitura1, 
	 output  [31:0]  BR_Leitura2, 
	 output  [31:0]  BR_Escrita, 
	 output  [31:0]  Saida_ULA, 
    input   [4:0]   RegDispSelect,
	 output  [31:0]  RegDisp,
    output          LeMem, 
	 output 			  EscreveMem,
    output  [31:0]  MemD_Endereco, 
	 output  [31:0]  MemD_DadoEscrita, 
	 output  [31:0]  MemD_DadoLeitura,
    output  [3:0]   MemD_ByteEnable, 
    output  [6:0]   Estado,
	 output  [31:0]  Debug
`endif

);


// Interface Comum entre o processador e os mostradores
wire [4:0]  wRegDispSelect;
wire [31:0] wPC, wRegDisp, wInstr;
wire [31:0] wDebug;
wire [17:0] wSinaisControle;
wire [5:0]  wControlState;
wire [4:0]  wVGASelect;
wire [31:0] wVGARead;
wire [31:0] wBRReadA,wBRReadB, wBRWrite, wULA;

wire CLK, oCLK_50, oCLK_25, oCLK_100, oCLK_150, oCLK_200, oCLK_27, oCLK_18;
wire Reset, CLKSelectFast, CLKSelectAuto;
wire wbreak;



/* **************  Definicao do endereco inicial do PC  ************************* */
wire [31:0]  PCinicial;
assign PCinicial = BEGINNING_TEXT;


/* ********************** Barramento de Dados *********************************** */
wire [31:0] DAddress, DWriteData;
wire [31:0] DReadData;
wire        DWriteEnable, DReadEnable;
wire [3:0]  DByteEnable;

/* ********************** Barramento de Instrucoes ******************************* */
wire [31:0] IAddress, IWriteData;
wire [31:0] IReadData;
wire        IWriteEnable, IReadEnable;
wire [3:0]  IByteEnable;



// Para simulacao <Nomes ajustados>
`ifdef SIMULACAO
assign MClock         = CLK;
assign Clock25			= oCLK_25;
assign Clock50			= oCLK_50;
assign Clock100      = oCLK_100;
assign PC            = wPC;
assign Instrucao    	=  wInstr;
assign BR_Leitura1	= wBRReadA;
assign BR_Leitura2	= wBRReadB;
assign BR_Escrita		= wBRWrite;
assign Saida_ULA		= wULA;
assign wRegDispSelect = RegDispSelect;
assign RegDisp       = wRegDisp;
assign LeMem     		= DReadEnable;
assign EscreveMem    	= DWriteEnable;
assign MemD_Endereco		= DAddress;
assign MemD_DadoEscrita	= DWriteData;
assign MemD_DadoLeitura	= DReadData;
assign MemD_ByteEnable  = DByteEnable;
assign Estado    		= wControlState;
assign Debug  			= wDebug;
`endif


/* ********************* Gerador e gerenciador de Clock ********************* */

CLOCK_Interface CLOCK0(
	 .iCLK_50(CLOCK_50),						 // 50MHz
    .oCLK_50(oCLK_50),                  // 50MHz  <<  Que será usado em todos os dispositivos	 
    .oCLK_100(oCLK_100),                // 100MHz
	 .oCLK_150(oCLK_150),
    .oCLK_200(oCLK_200),                // 200MHz Usado no SignalTap II
	 .oCLK_25(oCLK_25),						 // Usado na VGA
	 .oCLK_27(oCLK_27),
	 .oCLK_18(oCLK_18),						 // Usado no Audio
    .CLK(CLK),                          // Clock da CPU
    .Reset(Reset),                      // Reset de todos os dispositivos
    //.CLKSelectFast(CLKSelectFast),      // visualização
    //.CLKSelectAuto(CLKSelectAuto),      // visualização
	 .CLKSelectFast(ON),
	 .CLKSelectAuto(ON),
    .iKEY(KEY),                         // controles dos clocks e reset
    .fdiv({3'b0,SW[4:0]}),              // divisor da frequencia CLK = iCLK_50/fdiv
    .Timer(SW[5]),                      // Timer de 10 segundos 
	 .iBreak(wbreak)							 // Break Point
);



/* ********************************* CPU ************************************ */
CPU CPU0 (
    .iCLK(oCLK_25),
	 //.iCLK(CLK),             				// Clock real do Processador
    .iCLK50(oCLK_50),       				// Clock 50MHz fixo, usado so na FPU Uniciclo
    .iRST(Reset),
    .iInitialPC(PCinicial),

    // Sinais de monitoramento
    .wPC(wPC),
    .wInstr(wInstr),
    .wDebug(wDebug),
    .wRegDispSelect(wRegDispSelect),
    .wRegDisp(wRegDisp),
    .wControlState(wControlState),
    .wControlSignals(wSinaisControle),
    .wVGASelect(wVGASelect),
    .wVGARead(wVGARead),
	 .wBRReadA(wBRReadA),
	 .wBRReadB(wBRReadB),
	 .wBRWrite(wBRWrite),
	 .wULA(wULA),
	 
    // Barramento Dados
    .DwReadEnable(DReadEnable), 
	 .DwWriteEnable(DWriteEnable),
    .DwByteEnable(DByteEnable),
    .DwAddress(DAddress), 
	 .DwWriteData(DWriteData),
	 .DwReadData(DReadData),

    // Barramento Instrucoes - Nao tem no multiciclo
    .IwReadEnable(IReadEnable), 
	 .IwWriteEnable(IWriteEnable),
    .IwByteEnable(IByteEnable),
    .IwAddress(IAddress), 
	 .IwWriteData(IWriteData), 
	 .IwReadData(IReadData),

);



/* ************************* Memoria RAM Interface ************************** */

`ifdef MULTICICLO // Multiciclo

Memory_Interface MEMORY(
    .iCLK(oCLK_25),
	 //.iCLK(CLK), 
	 .iCLKMem(CLOCK_50), //?!? oCLK_50
    // Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);
`endif

`ifndef MULTICICLO  // Uniciclo e Pipeline

DataMemory_Interface MEMDATA(
    .iCLK(oCLK_25),
	 //.iCLK(CLK), 
	 .iCLKMem(CLOCK_50), //?!? oCLK_50
    // Barramento de dados
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);

CodeMemory_Interface MEMCODE(
    .iCLK(oCLK_25),
	 //.iCLK(CLK), 
	 .iCLKMem(CLOCK_50),  //?!? oCLK_50
    // Barramento de Instrucoes
    .wReadEnable(IReadEnable), 
	 .wWriteEnable(IWriteEnable),
    .wByteEnable(IByteEnable),
    .wAddress(IAddress), 
	 .wWriteData(IWriteData), 
	 .wReadData(IReadData)
);
`endif



/* ****************LEDR Interface  ********* */

assign LEDR[9:4]   = wControlState;
assign LEDR[3]		 = 1'b0;
assign LEDR[2]     = CLKSelectAuto;
assign LEDR[1]     = CLKSelectFast;
assign LEDR[0]     = CLK;


											
/* **************************** StopWatch Interface ***************************** */
STOPWATCH_Interface  stopwatch0 (
   .iCLK_50(oCLK_50), 
	.iCLK(CLK),
    //  Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);


/* **************************** LFSR Interface ***************************** */
LFSR_interface  lfsr0 (
	.iCLK_50(oCLK_50),
	//  Barramento
	.wReadEnable(DReadEnable), 
	.wAddress(DAddress), 
	.wReadData(DReadData)
);




								

`ifdef SIMULACAO  

assign 	wbreak=1'b0;

`else


	 
/* ********************* 7 Segment Displays Interface ********************** */
wire [31:0] wOutput;

assign wOutput = 	SW[9:8]==2'b11 ? wPC :
						SW[9:8]==2'b10 ? wInstr :
						SW[9:8]==2'b01 ? wDebug :
						SW[9:8]==2'b00 ? 32'b0 : 32'b0; // slot livre

Display7_Interface Display70   (	.HEX0_D(HEX0), 
											.HEX1_D(HEX1), 
											.HEX2_D(HEX2), 
											.HEX3_D(HEX3), 
											.HEX4_D(HEX4), 
											.HEX5_D(HEX5), 
											.Output(wOutput));
											
	 
/* **************************** Break Interface ***************************** */
Break_Interface  break0 (
   .iCLK_50(oCLK_50), 
	.iCLK(CLK), 
	.Reset(Reset),
   .oBreak(wbreak),
	.iKEY(KEY),
	.iPC(wPC),
    //  Barramento Dados
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);											
			


/* ***************************** VGA Interface ****************************** */
wire [4:0]  wVGASelectIn;
wire [31:0] wVGAReadIn;
assign wVGAReadIn       = wVGARead;
assign wVGASelect       = wVGASelectIn;

VGA_Interface VGA0 (
    .CLK(CLK), 
	 .iCLK_50(oCLK_50),
	 .iCLK2_50(CLOCK2_50), 
	 .iRST(Reset),
	 .oVGA_CLK(VGA_CLK),
    .oVGA_HS(VGA_HS), 
	 .oVGA_VS(VGA_VS), 
	 .oVGA_BLANK_N(VGA_BLANK_N), 
	 .oVGA_SYNC_N(VGA_SYNC_N),
    .oVGA_R(VGA_R), 
	 .oVGA_G(VGA_G), 
	 .oVGA_B(VGA_B),
    .oVGASelect(wVGASelectIn),
    .iVGARead(wVGAReadIn),
    .iDebugEnable(SW[9]),
    // Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);



/* ************************* Audio CODEC Interface ************************** */
wire audio_clock_flip_flop, audio_proc_clock_flip_flop;

AudioCODEC_Interface Audio0 (
    .iCLK(CLK), 
	 .iCLK_50(oCLK_50),  
    .iCLK_18(oCLK_18),
	 .Reset(Reset),
    .oTD1_RESET_N(TD_RESET_N),
    .I2C_SDAT(FPGA_I2C_SDAT),
    .oI2C_SCLK(FPGA_I2C_SCLK),
    .AUD_ADCLRCK(AUD_ADCLRCK),
    .iAUD_ADCDAT(AUD_ADCDAT),
    .AUD_DACLRCK(AUD_DACLRCK),
    .oAUD_DACDAT(AUD_DACDAT),
    .AUD_BCLK(AUD_BCLK),
    .oAUD_XCK(AUD_XCK),
    // Para o sintetizador
    .wsaudio_outL(wsaudio_outL),
    .wsaudio_outR(wsaudio_outR),
    // Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData),
    // Interrupcao
    .audio_clock_flip_flop(audio_clock_flip_flop),
    .audio_proc_clock_flip_flop(audio_proc_clock_flip_flop)
);


/* ************************* Teclado PS2 Interface ************************** */
wire ps2_scan_ready_clock, keyboard_interrupt;

TecladoPS2_Interface TecladoPS20 (
    .iCLK(CLK), 
	 .iCLK_50(oCLK_50), 
	 .Reset(Reset),
    .PS2_KBCLK(PS2_CLK),
    .PS2_KBDAT(PS2_DAT),
    // Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData),
    //Interrupcao
    .ps2_scan_ready_clock(ps2_scan_ready_clock),
    .keyboard_interrupt(keyboard_interrupt)
);



/* ************************ Sintetizador Interface ************************* */
wire [15:0] wsaudio_outL, wsaudio_outR;

Sintetizador_Interface Sintetizador0 (
    .iCLK(CLK), 
	 .iCLK_50(oCLK_50), 
	 .Reset(Reset),
    .AUD_DACLRCK(AUD_DACLRCK),
    .AUD_BCLK(AUD_BCLK),
    .wsaudio_outL(wsaudio_outL), 
	 .wsaudio_outR(wsaudio_outR),
    //  Barramento Principal
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);


/* **************************** Mouse Interface ***************************** */
wire reg_mouse_keyboard, received_data_en_contador_enable;

MousePS2_Interface Mouse0 (
    .iCLK(CLK), 
	 .iCLK_50(oCLK_50), 
	 .Reset(Reset),
    .PS2_KBCLK(PS2_CLK),
    .PS2_KBDAT(PS2_DAT),
    //  Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData),
    // Interrupcao
    .reg_mouse_keyboard(reg_mouse_keyboard),
    .received_data_en_contador_enable(received_data_en_contador_enable)
);



/* **************************** IrDA Interface ***************************** */

IrDA_Interface  IrDA0 (
   .iCLK_50(oCLK_50), 
	.iCLK(CLK), 
	.Reset(Reset),
   .oIRDA_TXD(IRDA_TXD),    //    IrDA Transmitter
   .iIRDA_RXD(IRDA_RXD),    //    IrDA Receiver
    //  Barramento
    .wReadEnable(DReadEnable), 
	 .wWriteEnable(DWriteEnable),
    .wByteEnable(DByteEnable),
    .wAddress(DAddress), 
	 .wWriteData(DWriteData), 
	 .wReadData(DReadData)
);


IrDA_decoder  IrDA_decoder0 (
   .iCLK_50(oCLK_50), 
	.iCLK(CLK), 
	.Reset(Reset),
   .iIRDA_RXD(IRDA_RXD),    //    IrDA Receiver
	
	.wAddress(DAddress),
	.oCode(DReadData),
	.wReadEnable(DReadEnable),
	.iselect(IRDAWORD)
);


`endif



endmodule



