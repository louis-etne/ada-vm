with VM.Word; use VM.Word;

package VM.Instruction is

    type Instruction_Enum is (
        -- General
        INST_NOP,
        
        -- Stack
        INST_PUSH,
        INST_POP,

        -- Math
        INST_ADD,
        INST_SUB,
        INST_MUL,
        INST_DIV,

        -- Control flow
        INST_JMP
    );

    type Instruction_Type is record
        T : Instruction_Enum := INST_NOP;
        W : Word_Type := 0;
    end record;

    function Instruction_Nop return Instruction_Type;
    
    function Instruction_Push (W : Word_Type) return Instruction_Type;

    function Instruction_Pop return Instruction_Type;

    function Instruction_Add return Instruction_Type;

    function Instruction_Sub return Instruction_Type;

    function Instruction_Mul return Instruction_Type;

    function Instruction_Div return Instruction_Type;

    function Instruction_Jmp (W : Word_Type) return Instruction_Type;

end VM.Instruction;