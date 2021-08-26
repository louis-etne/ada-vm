package body VM.Instruction is

    function Instruction_Nop return Instruction_Type is
    begin
        return Instruction_Type'(INST_NOP, 0);
    end Instruction_Nop;

    function Instruction_Push (W : Word_Type) return Instruction_Type is
    begin
        return Instruction_Type'(INST_PUSH, W);
    end Instruction_Push;

    function Instruction_Pop return Instruction_Type is
    begin
        return Instruction_Type'(INST_POP, 0);
    end Instruction_Pop;

    function Instruction_Add return Instruction_Type is
    begin
        return Instruction_Type'(INST_ADD, 0);
    end Instruction_Add;

    function Instruction_Sub return Instruction_Type is
    begin
        return Instruction_Type'(INST_SUB, 0);
    end Instruction_Sub;

    function Instruction_Mul return Instruction_Type is
    begin
        return Instruction_Type'(INST_MUL, 0);
    end Instruction_Mul;

    function Instruction_Div return Instruction_Type is
    begin
        return Instruction_Type'(INST_DIV, 0);
    end Instruction_Div;

    function Instruction_Jmp (W : Word_Type) return Instruction_Type is
    begin
        return Instruction_Type'(INST_JMP, W);
    end Instruction_Jmp;

end VM.Instruction;