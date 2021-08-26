with VM.Error; use VM.Error;
with VM.Machine; use VM.Machine;

package VM.Debug is

    procedure Process_Error (Machine : Machine_Type; Err : Error_Enum);

    procedure Dump (Machine : Machine_Type);

end VM.Debug;