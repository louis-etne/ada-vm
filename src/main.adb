with VM.Debug;
with VM.Error;
with VM.Instruction;
with VM.Machine;
with VM.Program;
with VM.Stack;
with VM.Word;
with Ada.Text_IO;

procedure Main is
    use VM.Instruction;
    use VM.Machine;
    use VM.Debug;
    use VM.Program;
    use VM.Stack;
    use VM.Error;
    use VM.Word;

    Machine : Machine_Type;

    Program : Program_Type := (
        Instruction_Push (1),
        Instruction_Push (1),
        Instruction_Add,
        Instruction_Jmp (2),
        Instruction_Nop
    );
begin
    Dump (Machine);
    Process_Error (Machine, Execute_Program (Machine, Program));
    Dump (Machine);
end Main;