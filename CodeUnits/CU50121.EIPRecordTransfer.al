codeunit 50121 "EIP Record Transfer"
{
    trigger OnRun()
    begin
        
    end;
    
    var
        
        

    procedure RealiseOrder(OrderRec: Record "EIP Transport Order")
    var
        //dt: DataTransfer;
        RealisedRec: Record "EIP Realised Transport Order";
    begin
        //dt.SetTables(Database::"EIP Transport Order",Database::"EIP Realised Transport Order");
        //dt.AddFieldValue();
        //dt.CopyRows();
        RealisedRec.Init();
        RealisedRec."No.":='';
        RealisedRec.TransferFields(OrderRec);
        RealisedRec.Insert();
    end;
}