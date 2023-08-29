page 50123 "EIP Realised Transport Order C"
{
    ApplicationArea = All;
    Caption = 'EIP Realised Transport Order Card';
    PageType = Card;
    SourceTable = "EIP Realised Transport Order";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Buyer; Rec.Buyer)
                {
                    ToolTip = 'Specifies the value of the Buyer field.';
                }
            }
        }
    }
    actions
    {
        area(Creation){
        action(ActionName)
        {
            ApplicationArea = All;
            
            trigger OnAction()
            begin
                
            end;
        }
        }
    }
}
