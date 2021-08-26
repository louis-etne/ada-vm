with VM.Instruction; use VM.Instruction;

package VM.Program is

    type Instruction_Pointer_Type is new Positive;

    type Program_Type is array (Instruction_Pointer_Type range <>) of Instruction_Type;

end VM.Program;