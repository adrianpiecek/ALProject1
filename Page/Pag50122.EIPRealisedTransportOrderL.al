page 50122 "EIP Realised Transport Order L"
{
    ApplicationArea = All;
    Caption = 'EIP Realised Transport Order List';
    PageType = List;
    SourceTable = "EIP Realised Transport Order";
    CardPageId=50123;
    UsageCategory=Lists;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    Caption='No.';
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Buyer; Rec.Buyer)
                {
                    
                    ToolTip = 'Specifies the value of the Buyer field.';
                }
            }
            
        }
    }
}
