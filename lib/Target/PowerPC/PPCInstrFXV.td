//===-- PPCInstrFXV.td - The Fixed Point Vector Instruction Set Extension -*- tablegen -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file describes the Fixed-Point Vector Instruction Set
//
//===----------------------------------------------------------------------===//

def HasFXV : Predicate<"PPCSubTarget->hasFXV()">;


//===----------------------------------------------------------------------===//
// Helpers for defining instructions that directly correspond to intrinsics.

class FXV_Halfword_Ty<bits<9> xo, string opc, Intrinsic IntID>
      : FXVForm<xo, (outs vrrc:$vD), (ins vrrc:$vA, vrrc:$vB),
                    !strconcat(opc, " $vD, $vA, $vB"),
                    [(set v8i16:$vD, (IntID v8i16:$vA, v8i16$vB))]>

class FXV_Byte_Ty<bits<9> xo, string opc, Intrinsic IntID>
      : FXVForm<xo, (outs vrrc:$vD), (ins vrrc:$vA, vrrc:$vB),
                    !strconcat(opc, " $vD, $vA, $vB"),
                    [(set v16i8:$vD, (IntID v16i8:$vA, v16i8$vB))]>

def SPLATH : FXV_Halfword_Ty<268, "splath", int_ppc_fxv_splath>;
def SPLATB : FXV_Byte_Ty<269, "splatb", int_ppc_fxv_splatb>;

def MAHM : FXV_Halfword_Ty<12, "mahm", int_ppc_fxv_mahm>;
def MATACHM : FXV_Halfword_Ty<44, "matachm", int_ppc_fxv_matachm>;
def MULHM : FXV_Halfword_Ty<76, "mulhm", int_ppc_fxv_mulhm>;
def MULTACHM : FXV_Halfword_Ty<108, "multachm", int_ppc_fxv_multachm>;
def SUBHM : FXV_Halfword_Ty<332, "subhm", int_ppc_fxv_subhm>;
def ADDACTACHM : FXV_Halfword_Ty<364, "addactachm", int_ppc_fxv_addactachm>;
def ADDTACHM : FXV_Halfword_Ty<428, "addtachm", int_ppc_fxv_addtachm>;
def ADDACHM : FXV_Halfword_Ty<396, "addachm", int_ppc_fxv_addachm>;
def ADDHM : FXV_Halfword_Ty<460, "addhm", int_ppc_fxv_addhm>;
def CMPHM : FXV_Halfword_Ty<300, "cmphm", int_ppc_fxv_cmphm>;
def MTACH : FXV_Halfword_Ty<15, "mtach", int_ppc_fxv_mtach>;

def MABM : FXV_Byte_Ty<13, "mabm", int_ppc_fxv_mabm>;
def MATACBM : FXV_Byte_Ty<45, "matacbm", int_ppc_fxv_matacbm>;
def MULBM : FXV_Byte_Ty<77, "mulbm", int_ppc_fxv_mulbm>;
def MULTACBM : FXV_Byte_Ty<109, "multacbm", int_ppc_fxv_multacbm>;
def SUBBM : FXV_Byte_Ty<333, "subbm", int_ppc_fxv_subbm>;
def ADDACTACB : FXV_Byte_Ty<365, "addactacb", int_ppc_fxv_addactacb>;
def ADDTACB : FXV_Byte_Ty<429, "addtacb", int_ppc_fxv_addtacb>;
def ADDACBM : FXV_Byte_Ty<397, "addacbm", int_ppc_fxv_addacbm>;
def ADDBM : FXV_Byte_Ty<461, "addbm", int_ppc_fxv_addbm>;
def CMPB : FXV_Byte_Ty<301, "cmpb", int_ppc_fxv_cmpb>;
def MTACB : FXV_Byte_Ty<14, "mtacb", int_ppc_fxv_mtacb>;

def MAHFS : FXV_Halfword_Ty<28, "mahfs", int_ppc_fxv_mahfs>;
def MTACHF : FXV_Halfword_Ty<31, "mtachf", int_ppc_fxv_mtachf>;
def MATACHFS : FXV_Halfword_Ty<60, "matachfs", int_ppc_fxv_matachfs>;
def MULHFS : FXV_Halfword_Ty<92, "mulhfs", int_ppc_fxv_mulhfs>;
def MULTACHFS : FXV_Halfword_Ty<124, "multachfs", int_ppc_fxv_multachfs>;
def SUBHFS : FXV_Halfword_Ty<348, "subhfs", int_ppc_fxv_subhfs>;
def ADDACTACHF : FXV_Halfword_Ty<380, "addactachf", int_ppc_fxv_addactachf>;
def ADDACHFS : FXV_Halfword_Ty<412, "addachfs", int_ppc_fxv_addachfs>;
def ADDHFS : FXV_Halfword_Ty<476, "addhfs", int_ppc_fxv_addhfs>;

def MABFS : FXV_Byte_Ty<29, "mabfs", int_ppc_fxv_mabfs>;
def MTACBF : FXV_Byte_Ty<30, "mtacbf", int_ppc_fxv_mtacbf>;
def MATACBFS : FXV_Byte_Ty<61, "matacbfs", int_ppc_fxv_matacbfs>;
def MULBFS : FXV_Byte_Ty<93, "mulbfs", int_ppc_fxv_mulbfs>;
def MULTACBFS : FXV_Byte_Ty<125, "multacbfs", int_ppc_fxv_multacbfs>;
def SUBBFS : FXV_Byte_Ty<349, "subbfs", int_ppc_fxv_subbfs>;
def ADDACTACBF : FXV_Byte_Ty<381, "addactacbf", int_ppc_fxv_addactacbf>;
def ADDACBFS : FXV_Byte_Ty<413, "addacbfs", int_ppc_fxv_addacbfs>;
def ADDBFS : FXV_Byte_Ty<477, "addbfs", int_ppc_fxv_addbfs>;

def VSEL : FXV_Byte_Ty<319, "vsel", int_ppc_fxv_vsel>; 
def SHH : FXV_Halfword_Ty<316, "shh", int_ppc_fxv_shh>;
def SHB : FXV_Byte_Ty<317, "shb", int_ppc_fxv_shb>;
def PCKBU : FXV_Byte_Ty<239, "pckbu", int_ppc_fxv_pckbu>;
def PCKBL : FXV_Byte_Ty<255, "pckbl", int_ppc_fxv_pckbl>;
def UPCKBL : FXV_Byte_Ty<287, "upckbl", int_ppc_fxv_upckbl>;
def UPCKBR : FXV_Byte_Ty<271, "upckbr", int_ppc_fxv_upckbr>;

// 5.2.8 Load/Store instructions
// lax 492
// stax 508
// inx 236
// outx 252




