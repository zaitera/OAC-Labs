module Ctrl_Transf (
    input  [2:0] iFunct3,
    input [1:0] iCOrigPC,
    input [5:0] iState,
    output oCTransf, oWriteCond,
    input iZero
);
assign oWriteCond = oCTransf;
// `ifdef UNICICLO
always @ ( * ) begin
    case (iCOrigPC)  
        2'b00:// 00 -> Normal
            oCTransf = 1'b0;
        2'b01:// 01 -> Branch 
			  begin
                case(iFunct3)
                    F3_BEQ:
                        oCTransf = (iZero ? 1'b1 : 1'b0);
                    F3_BNE:
                        oCTransf = (!iZero) ? 1'b1 : 1'b0;
                    F3_BLT:
                        oCTransf = (!iZero) ? 1'b1 : 1'b0;
                    F3_BGE:
                        oCTransf = (iZero) ? 1'b1 : 1'b0;
                    F3_BLTU:
                        oCTransf = (!iZero) ? 1'b1 : 1'b0;
                    F3_BGEU:
                        oCTransf = (iZero) ? 1'b1 : 1'b0;
    			  endcase
                  //oWriteCond = oCTransf;
              end
        2'b10:// 10 -> Jal 
            oCTransf = 1'b1;
        2'b11:// 11 -> Jalr
            oCTransf = 1'b1;
        default:
            oCTransf = 1'b0;
    endcase
end
//`endif

// `ifdef MULTICICLO
// always @ ( * ) begin
//     case(iState)
//         STATE_FETCH,
//         STATE_BRANCH,
//         STATE_JAL,
//         STATE_JALR:
//         begin
//             case (iCOrigPC)  
//                 2'b00:// 00 -> Normal
//                     begin 
//                         oCTransf = 1'b0;
//                         oWriteCond = 1'b1;
//                     end
//                 2'b01:// 01 -> Branch 
//                     case(iFunct3)
//                         F3_BEQ,
//                         F3_BGE,
//                         F3_BGEU:
//                             begin  
//                                 oCTransf = 1'b1;
//                                 oWriteCond = oCTransf;
//                                 // oCTransf = iZero ? 1'b1 : 1'b0;
//                                 // oWriteCond = oCTransf; 
//                             end
//                         F3_BNE,
//                         F3_BLT,
//                         F3_BLTU:
//                             begin
//                                 oCTransf = 1'b1;
//                                 oWriteCond = oCTransf;
//                                 // oCTransf = (!iZero) ? 1'b1 : 1'b0;
//                                 // oWriteCond = oCTransf;  
//                             end
//                     endcase
                            
//                 2'b10:// 10 -> Jal 
//                     begin
//                         oCTransf = 1'b1;
//                         oWriteCond = oCTransf;
//                     end
//                 2'b11:// 11 -> Jalr
//                     begin
//                         oCTransf = 1'b1;
//                         oWriteCond = oCTransf;
//                     end
//                 default:
//                     oCTransf = 1'b0;
//             endcase
        
//         end
//         default:
//             oWriteCond = 1'b0;
//     endcase
// end

// `endif
endmodule