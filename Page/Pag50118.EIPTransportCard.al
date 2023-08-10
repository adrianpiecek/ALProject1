page 50118 "EIP Transport Card"
{
    ApplicationArea = All;
    Caption = 'EIP Transport Card';
    PageType = Card;
    SourceTable = "Transport Order";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(Buyer; Rec.Buyer)
                {
                    ToolTip = 'Specifies the value of the Buyer field.';
                }
                field("Collection Point Name"; Rec."Collection Point Name")
                {
                    ToolTip = 'Specifies the value of the Collection Point Name field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Order Date and Time"; Rec."Order Date and Time")
                {
                    ToolTip = 'Specifies the value of the Order Date and Time field.';
                }
                field("Order Status"; Rec."Order Status")
                {
                    ToolTip = 'Specifies the value of the Order Status field.';
                }
            }
        }
    }
}
