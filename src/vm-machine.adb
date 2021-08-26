with VM.Word; use VM.Word;
with VM.Machine.Execute; use VM.Machine.Execute;

package body VM.Machine is

    function Execute_Instruction 
        (Machine     : in out Machine_Type;
         Instruction : in     Instruction_Type)
    return Error_Enum is
    begin
        case Instruction.T is
            when INST_NOP  => return ERR_OK;
            when INST_PUSH => return Execute_Instruction_Push (Machine, Instruction.W);
            when INST_POP  => return Execute_Instruction_Pop (Machine);
            when INST_ADD  => return Execute_Instruction_Add (Machine);
            when INST_SUB  => return Execute_Instruction_Sub (Machine);
            when INST_MUL  => return Execute_Instruction_Mul (Machine);
            when INST_DIV  => return Execute_Instruction_Div (Machine);
            when INST_JMP  => return Execute_Instruction_Jmp (Machine, Instruction.W);
            when others    => return ERR_UNKNOWN;
        end case;
    end Execute_Instruction;


    function Execute_Program
        (Machine : in out Machine_Type;
         Program : in     Program_Type)
    return Error_Enum is 
        Status : Error_Enum;
        I : Instruction_Pointer_Type;
    begin
        Program_Loop: loop
            I := Machine.Instruction_Pointer;
            Status := Execute_Instruction (Machine, Program (I));

            exit Program_Loop when Status /= ERR_OK or else Machine.Instruction_Pointer = Program'Last;

            if Machine.Instruction_Pointer = I then -- Means we didn't jump
                Machine.Instruction_Pointer := Machine.Instruction_Pointer + 1;
            end if;

        end loop Program_Loop;

        return Status;
    end Execute_Program;
end VM.Machine;