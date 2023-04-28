unit terminal;

interface

uses
    board;

type

    TTerminal = class(Tobject)
    private
        PBoard : TBoard;
        
    protected
        
    public
        constructor Create(const ABoard : TBoard); override;
        procedure DrawBoard;

    published
        
    end;
    

implementation

uses 
    crt, Tile, Piece, exceptions;

constructor TTerminal.Create(const ABoard : TBoard);
begin
    if ABoard = nil then
        raise Exception.Create('Não foi informado um board válido');

    Self.PBoard := ABoard;
end;

procedure TTerminal.DrawBoard;
var
    column, line: shortint;
begin
    for line := 1 to 8 do
        for column := 1 to 8 do
            begin
                GotoXY(column + 4, line + 4);
                PBoard.Board[column, line].TextOut();
            end;
end;

end.