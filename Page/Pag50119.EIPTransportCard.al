page 50119 "EIP Transport Card"
{
    ApplicationArea = All;
    Caption = 'EIP Transport Card';
    PageType = Card;
    SourceTable = "EIP Transport Order";
    
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
                
                field("Employee receiving the Order"; Rec."Employee receiving the Order")
                {
                    ToolTip = 'Specifies the value of the Employee receiving the Order field.';
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
                
                field("Vechicle Transporting Order"; Rec."Vechicle Transporting Order")
                {
                    ToolTip = 'Specifies the value of the Vechicle Transporting Order field.';
                }
            }
            group("Pickup")
            {
                Caption='Pickup';
                field("Pickup Point Name"; Rec."Pickup Point Name")
                {
                    ToolTip = 'Specifies the value of the Pickup Point Name field.';
                }
                
                field("Alt. Pickup Point Name"; Rec."Alt. Pickup Point Name")
                {
                    ToolTip = 'Specifies the value of the Alt. Pickup Point Name field.';
                }

                field("Pickup Point Postal Code"; Rec."Pickup Point Postal Code")
                {
                    ToolTip = 'Specifies the value of the Pickup Point Postal Code field.';
                }
                field("Date and Time of Pickup"; Rec."Date and Time of Pickup")
                {
                    ToolTip = 'Specifies the value of the Date and Time of Pickup field.';
                }
                field("Distance from Pickup Point"; Rec."Distance from Pickup Point")
                {
                    ToolTip = 'Specifies the value of the Distance from Pickup Point field.';
                }
            }
            group(Delivery)
            {
                Caption='Delivery';
                field("Alt. Delivery Point Adress"; Rec."Alt. Delivery Point Adress")
                {
                    ToolTip = 'Specifies the value of the Alt. Delivery Point Adress field.';
                }
                field("Alt. Delivery Point Name"; Rec."Alt. Delivery Point Name")
                {
                    ToolTip = 'Specifies the value of the Alt. Delivery Point Name field.';
                }
                field("Delivering Employee"; Rec."Delivering Employee")
                {
                    ToolTip = 'Specifies the value of the Delivering Employee field.';
                }
                field("Delivering Vechicle"; Rec."Delivering Vechicle")
                {
                    ToolTip = 'Specifies the value of the Delivering Vechicle field.';
                }
                field("Delivery Date and Time"; Rec."Delivery Date and Time")
                {
                    ToolTip = 'Specifies the value of the Delivery Date and Time field.';
                }
                field("Delivery Point Adress"; Rec."Delivery Point Adress")
                {
                    ToolTip = 'Specifies the value of the Delivery Point Adress field.';
                }
                field("Delivery Point Name"; Rec."Delivery Point Name")
                {
                    ToolTip = 'Specifies the value of the Delivery Point Name field.';
                }
                field("Delivery Point Postal Code"; Rec."Delivery Point Postal Code")
                {
                    ToolTip = 'Specifies the value of the Delivery Point Postal Code field.';
                }
                field("Distance from Delivery Point"; Rec."Distance from Delivery Point")
                {
                    ToolTip = 'Specifies the value of the Distance from Delivery Point field.';
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
    Status: Enum StatusEnum;
    begin
        if ((xRec."Order Status"=Status::"To Receive") and (Rec."Order Status"=Status::"To Deliever")) then begin
            rec.TestField("Distance from Pickup Point");
        end;
    end;
}
