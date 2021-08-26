with VM.Error; use VM.Error;
with VM.Instruction; use VM.Instruction;
with VM.Program; use VM.Program;
with VM.Stack; use VM.Stack;

package VM.Machine is

    type Machine_Type is record
        Stack : Stack_Type := (others => 0);
        Stack_Pointer : Stack_Pointer_Type := Stack_Pointer_Type'First;
        Instruction_Pointer : Instruction_Pointer_Type := Instruction_Pointer_Type'First;
    end record;

    function Execute_Instruction 
        (Machine     : in out Machine_Type;
         Instruction : in     Instruction_Type)
    return Error_Enum;

    function Execute_Program
        (Machine : in out Machine_Type;
         Program : in     Program_Type)
    return Error_Enum;

end VM.Machine;