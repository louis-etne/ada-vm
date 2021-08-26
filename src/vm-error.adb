package body VM.Error is

    function Image (Err : Error_Enum) return String is
    begin
        return (case Err is
            when ERR_OK              => "ERR_OK",
            when ERR_UNKNOWN         => "ERR_UNKNOWN",
            when ERR_UNKNOWN_ADDR    => "ERR_UNKNOWN_ADDR",
            when ERR_STACK_OVERFLOW  => "ERR_STACK_OVERFLOW",
            when ERR_STACK_UNDERFLOW => "ERR_STACK_UNDERFLOW",
            when ERR_DIV_ZERO        => "ERR_DIV_ZERO");
    end Image;

end VM.Error;