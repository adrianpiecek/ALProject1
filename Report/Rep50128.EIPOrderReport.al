report 50128 "EIP Order Report"
{
    Caption = 'EIP Order Report';
    dataset
    {
        dataitem(EIPTransportOrder; "EIP Transport Order")
        {
            column(No; "No.")
            {
            }
            column(OrderDateandTime; "Order Date and Time")
            {
            }
            column(OrderStatus; "Order Status")
            {
            }
            column(Buyer; Buyer)
            {
            }
            column(PickupPointName; "Pickup Point Name")
            {
            }
            column(NoSeries; "No. Series")
            {
            }
            column(AltPickupPointName; "Alt. Pickup Point Name")
            {
            }
            column(PickupPointPostalCode; "Pickup Point Postal Code")
            {
            }
            column(EmployeereceivingtheOrder; "Employee receiving the Order")
            {
            }
            column(VechicleTransportingOrder; "Vechicle Transporting Order")
            {
            }
            column(DateandTimeofPickup; "Date and Time of Pickup")
            {
            }
            column(DistancefromPickupPoint; "Distance from Pickup Point")
            {
            }
            column(DeliveryPointName; "Delivery Point Name")
            {
            }
            column(AltDeliveryPointName; "Alt. Delivery Point Name")
            {
            }
            column(DeliveryPointAdress; "Delivery Point Adress")
            {
            }
            column(AltDeliveryPointAdress; "Alt. Delivery Point Adress")
            {
            }
            column(DeliveryPointPostalCode; "Delivery Point Postal Code")
            {
            }
            column(DeliveringEmployee; "Delivering Employee")
            {
            }
            column(DeliveringVechicle; "Delivering Vechicle")
            {
            }
            column(DeliveryDateandTime; "Delivery Date and Time")
            {
            }
            column(DistancefromDeliveryPoint; "Distance from Delivery Point")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
