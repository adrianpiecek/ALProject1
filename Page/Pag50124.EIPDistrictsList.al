page 50124 "EIP Districts List"
{
    ApplicationArea = All;
    Caption = 'EIP Disctricts';
    PageType = List;
    SourceTable = "EIP District";
    CardPageId = "EIP Districts Card";
    UsageCategory=Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Area Code"; Rec."Area Code")
                {
                    ToolTip = 'Specifies the value of the Area Code field.';
                }
                field("Area Name"; Rec."Area Name")
                {
                    ToolTip = 'Specifies the value of the Area Name field.';
                }
                field("Signed Employee"; Rec."Signed Employee")
                {
                    ToolTip = 'Specifies the value of the Signed Employee field.';
                }
                field("Signed Vechicle"; Rec."Signed Vechicle")
                {
                    ToolTip = 'Specifies the value of the Signed Vechicle field.';
                }
                field("Number of Received Packages"; Rec."Number of Received Packages")
                {
                    Caption='Number of Packages to Receive';
                }
            }
        }
    }
    
}
