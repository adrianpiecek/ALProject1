pageextension 50102 ResourceListWithImport extends "Resource List"
{


    layout
    {
        // Add changes to page layout here
    }

    actions
    {

        addfirst("&Resource")
        {
            group("Import Transport Info")
            {
                action(Import)
                {
                    ApplicationArea = All;
                    Caption = 'Import';
                    trigger OnAction()
                    var
                        FleetFile: File;
                        StringLine: Text;
                        varSize: Integer;
                        FileMgt: Codeunit "File Management";
                        ServerFilePath: Text[50];

                        FleetStream: InStream;

                    begin
                        File.Upload('test import', 'C:\EIP\', 'Text file (*.txt)|*.txt', 'Fleet.txt', ServerFilePath);
                        FleetFile.Open(ServerFilePath);
                        FleetFile.CreateInStream(FleetStream);
                        //FleetStream.ReadText(FleetFile);
                        while not (FleetStream.EOS) do begin
                            FleetStream.ReadText(StringLine);
                            //Message(String);
                            CreateResource(StringLine);

                            //FleetRecord.No:= 
                            //FleetRecord.Name:= 
                            //FleetRecord.Type:= 
                            //FleetRecord."Unit Price":= 
                        end;
                        FleetFile.Close();
                        //Message('The text is "%1" is %2 bytes', String, varSize);
                    end;
                }
            }
        }
    }

    var
        myInt: Integer;

    local procedure CreateResource(Line: Text);
    var
        CarRegistrationNo: Code[20];
        CarBrand: Text;
        CarModel: Text;
        CarName: Text;
        CarPrice: Decimal;
        FleetRecord: Record Resource;
        TableOfData: List of [text];
    begin
        TableOfData := Line.Split(';');

        CarRegistrationNo := TableOfData.get(1);
        CarBrand := TableOfData.get(2);
        Evaluate(CarModel, TableOfData.get(3));
        //TypeRead:=CarModel;
        //TypeRead:="Resource Type".FromInteger(CarModel);
        Evaluate(CarPrice, TableOfData.get(4));
        FleetRecord."No." := CarRegistrationNo;
        if not FleetRecord.FindFirst() then begin

            CarName := CarBrand + CarModel;
            if StrLen(CarName) > MaxStrLen(FleetRecord.Name) then begin
                FleetRecord.Name := CarName.Substring(1, MaxStrLen(FleetRecord.Name));
                FleetRecord."Name 2" := CarName.Substring(101, MaxStrLen(FleetRecord."Name 2"));
            end else begin
                FleetRecord.Name := CarName;
            end;
            FleetRecord.Type := "Resource Type".FromInteger(2);
            FleetRecord."Base Unit of Measure" := 'KM';
            FleetRecord."Unit Price" := CarPrice;

            FleetRecord.Insert()

        end else begin
            Message('Vechicle with that No. (%1) already exists', CarRegistrationNo);
        end;

    end;
}

//deleyedinstert=true
//rename kodu na inicjaly
