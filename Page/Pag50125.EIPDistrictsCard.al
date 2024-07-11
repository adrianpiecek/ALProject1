page 50125 "EIP Districts Card"
{
    ApplicationArea = All;
    Caption = 'EIP Districts Card';
    PageType = Card;
    SourceTable = "EIP District";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Area Code"; Rec."Area Code")
                {
                    Caption = 'Area Code';
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
                field("Transport Order"; Order."No.")
                {
                    Caption='Order No.';
                    TableRelation="EIP Transport Order";
                }//sales order, subpage- sales order subform jako wzorzec
            }
            part("Orders To Receive";"EIP Distric Subform")
            {
                Caption='To Receive';
                ApplicationArea=Basic,Suite;
                Editable=true;
                Enabled=true;
                SubPageLink="Pickup Point Name"=field("Area Name");
                SubPageView=where("Order Status"=const("To Receive"));
            }
            part("Orders To Deliever";"EIP Distric Subform")
            {
                Caption='To Deliever';
                ApplicationArea=Basic,Suite;
                Editable=true;
                Enabled=true;
                SubPageLink="Pickup Point Name"=field("Area Name");
                SubPageView=where("Order Status"=const("To Deliever"));
            }
            part("Orders to Deliever2";"EIP District Sub To Deliever")
            {
                ApplicationArea=basic,suite;
                Editable=true;
                Enabled=true;
                SubPageLink="Pickup Point Name"=field("Area Name");
                

            }
        }
    }
    var 
    Order: Record "EIP Transport Order";
}
