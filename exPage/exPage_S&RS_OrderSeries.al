pageextension 50117 OrderNo extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
        addfirst("Number Series")
        {
            field("Transport Order Nos."; rec."Transport Order Nos.")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the code for the number series that will be used to assign numbers to transport orders.';
            }
            field("Realised Order Nos."; rec."Realised Order Nos.")
            {
                ApplicationArea=Basic, Suite;
                
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}