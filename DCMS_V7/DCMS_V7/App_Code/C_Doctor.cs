using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCMS_V7.App_Code
{
    public static class C_Doctor
    {
        public static void AddPatient(string firstname, string lastname, string phonenumber, string email, string city, string address, int day, int month, int year)
        {
            //checking the lastID in the Sysusers table
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var MAXID = (from patientfromDB in DB.Patients
                         select patientfromDB.ID).Max();
            //getting the ID of the city choosen
            var CityID = (from cityfromDB in DB.Cities
                          where cityfromDB.Name == city
                          select cityfromDB.ID).Max();

            DateTime Date = new DateTime(year, month, day);

            Patient thenewpatient = new Patient();
            thenewpatient.ID = MAXID + 1;
            thenewpatient.FirstName = firstname;
            thenewpatient.LastName = lastname;
            thenewpatient.PhoneNumber = phonenumber;
            thenewpatient.EmailAddress = email;
            thenewpatient.City = CityID;
            thenewpatient.Address = address;
            thenewpatient.DoB = Date;
            DB.Patients.InsertOnSubmit(thenewpatient);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
            for (int i = 1; i < 33; i++)
            {
                Tooth thenewTooth = new Tooth();
                var MAXToothID = (from T in DB.Tooths
                                  select T.ID).Max();
                thenewTooth.ID = MAXToothID + 1;
                thenewTooth.PatientID = MAXID + 1;
                thenewTooth.ToothNumber = i;
                thenewTooth.Status = "No Previous Threatment";
                DB.Tooths.InsertOnSubmit(thenewTooth);
                DB.SubmitChanges();
            }
        }
        public static void ModifyPatient(int ID, string firstname, string lastname, string phonenumber, string email, string city, string address, int day, int month, int year)
        {
            //checking the lastID in the Sysusers table
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var thenewpatient = (from patientfromDB in DB.Patients
                                 where patientfromDB.ID == ID
                                 select patientfromDB).Single();
            //getting the ID of the city choosen
            var CityID = (from cityfromDB in DB.Cities
                          where cityfromDB.Name == city
                          select cityfromDB.ID).Max();

            DateTime Date = new DateTime(year, month, day);

            thenewpatient.FirstName = firstname;
            thenewpatient.LastName = lastname;
            thenewpatient.PhoneNumber = phonenumber;
            thenewpatient.EmailAddress = email;
            thenewpatient.City = CityID;
            thenewpatient.Address = address;
            thenewpatient.DoB = Date;

            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }

        }
        public static void DeletePatient(int ID)
        {

            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var deletedPatient = from pat in DB.Patients
                                 where pat.ID == ID
                                 select pat;
            var deletedRequestedItems = from req in DB.RequestedItems
                                        where req.PatientID == ID
                                        select req;
            var deletedTeeth = from tee in DB.Tooths
                               where tee.PatientID == ID
                               select tee;
            foreach (var row in deletedRequestedItems)
            {
                var requestedImage = from img in DB.Images
                                     where img.ID == row.ID
                                     select img;
                var requestedPiece = from piecefromDB in DB.Pieces
                                     where piecefromDB.ID == row.ID
                                     select piecefromDB;
                foreach (var rowimage in requestedImage)
                {
                    DB.Images.DeleteOnSubmit(rowimage);
                }
                foreach (var rowpiece in requestedPiece)
                {
                    DB.Pieces.DeleteOnSubmit(rowpiece);
                }
                try
                {
                    DB.SubmitChanges();
                }
                catch
                {
                    DB.SubmitChanges();
                }
                DB.RequestedItems.DeleteOnSubmit(row);
            }
            foreach (var row in deletedTeeth)
            {
                var deletedtreat = from treat in DB.Treatments
                                   where treat.ToothID == row.ID
                                   select treat;
                foreach (var rowtreat in deletedtreat)
                {
                    DB.Treatments.DeleteOnSubmit(rowtreat);
                }
                try
                {
                    DB.SubmitChanges();
                }
                catch
                {
                    DB.SubmitChanges();
                }
                DB.Tooths.DeleteOnSubmit(row);
            }
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
            foreach (var row in deletedPatient)
            {
                DB.Patients.DeleteOnSubmit(row);
            }
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }//not tested
        public static void ModifyToothNote(int PatientID, int Toothnumber, string newnote)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var tooth = (from tee in DB.Tooths
                         where tee.PatientID == PatientID && tee.ToothNumber == Toothnumber
                         select tee).Single();
            tooth.Note = newnote;
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void AddTreatment(int TootID, int DoctorID, string kind, string note, int day, int month, int year, int hour, int minute)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var kindID = (from K in DB.Kinds
                          where K.KindString == kind
                          select K.ID).Single();
            var MAXID = (from treat in DB.Treatments
                         select treat.ID).Max();
            DateTime Date = new DateTime(year, month, day, hour, minute, 0);

            Treatment thenewTreatment = new Treatment();
            thenewTreatment.ID = MAXID + 1;
            thenewTreatment.DoctorID = DoctorID;
            thenewTreatment.ToothID = TootID;
            thenewTreatment.KindID = kindID;
            thenewTreatment.Date = Date;
            thenewTreatment.Note = note;
            DB.Treatments.InsertOnSubmit(thenewTreatment);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }

        }
        public static void DeleteTreatment(int TreatmentID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var treatment = (from treat in DB.Treatments
                             where treat.ID == TreatmentID
                             select treat).Single();
            DB.Treatments.DeleteOnSubmit(treatment);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }

        }
        public static void ModifyTreatment(int TreatmentID, string kind, string note, int day, int month, int year, int hour, int minute)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var treatment = (from treat in DB.Treatments
                             where treat.ID == TreatmentID
                             select treat).Single();
            var kindID = (from K in DB.Kinds
                          where K.KindString == kind
                          select K.ID).Single();
            DateTime Date = new DateTime(year, month, day, hour, minute, 0);
            treatment.KindID = kindID;
            treatment.Date = Date;
            treatment.Note = note;
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void RequestImage(int PatientID, int DoctorID, int LabID, string imagetype, int day, int month, int year, int hour, int minute, string note)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var typeID = (from T in DB.ImageTypes
                          where T.TypeString == imagetype
                          select T.ID).Single();
            var MAXIDitem = 0;
            if((from reqitem in DB.RequestedItems select reqitem.ID).Count()!=0)
                MAXIDitem = (from reqitem in DB.RequestedItems
                             select reqitem.ID).Max();
            var MAXIDimg = 0;
            if((from reqimg in DB.Images select reqimg.ID).Count()!=0)
                MAXIDimg = (from reqimg in DB.Images
                            select reqimg.ID).Max();

            DateTime Date = new DateTime(year, month, day, hour, minute, 0);
            RequestedItem thenewrequesteditem = new RequestedItem();
            thenewrequesteditem.ID = MAXIDitem + 1;
            thenewrequesteditem.LabID = LabID;
            thenewrequesteditem.Note = note;
            thenewrequesteditem.Date = Date;
            thenewrequesteditem.DoctorID = DoctorID;
            thenewrequesteditem.PatientID = PatientID;

            DB.RequestedItems.InsertOnSubmit(thenewrequesteditem);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }

            Image thenewimage = new Image();
            thenewimage.ID = MAXIDimg + 1;
            thenewimage.TypeID = typeID;
            DB.Images.InsertOnSubmit(thenewimage);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }


        }
        public static void RequestPiece(int PatientID, int DoctorID, int LabID, string Piecetype, int day, int month, int year, int hour, int minute, string note)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var typeID = (from T in DB.PieceTypes
                          where T.TypeString == Piecetype
                          select T.ID).Single();
            var MAXIDitem = 0;
            if((from reqitem in DB.RequestedItems select reqitem.ID).Count()!=0)
                MAXIDitem = (from reqitem in DB.RequestedItems
                             select reqitem.ID).Max();
            var MAXIDpiece = 0;
            if((from reqpiece in DB.Pieces select reqpiece.ID).Count()!=0)
                MAXIDpiece = (from reqpiece in DB.Pieces
                              select reqpiece.ID).Max();

            DateTime Date = new DateTime(year, month, day, hour, minute, 0);
            RequestedItem thenewrequesteditem = new RequestedItem();
            thenewrequesteditem.ID = MAXIDitem + 1;
            thenewrequesteditem.LabID = LabID;
            thenewrequesteditem.Note = note;
            thenewrequesteditem.Date = Date;
            thenewrequesteditem.DoctorID = DoctorID;
            thenewrequesteditem.PatientID = PatientID;

            DB.RequestedItems.InsertOnSubmit(thenewrequesteditem);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }

            Piece thenewpiece = new Piece();
            thenewpiece.ID = MAXIDpiece + 1;
            thenewpiece.TypeID = typeID;
            thenewpiece.Status = "Pending";
            DB.Pieces.InsertOnSubmit(thenewpiece);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }


        }
    }
}