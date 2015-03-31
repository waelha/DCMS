using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCMS_V7.App_Code
{
    public class C_Admin
    {
        public static void AddUser(string username, string password, string phonenumber, string email, string city, string address, bool admin, bool ban, string firstname, string Lastname, int day, int month, int year, string Specialty)
        {
            //checking the lastID in the Sysusers table
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var MAXID = (from user in DB.SysUsers
                         select user.ID).Max();
            //getting the ID of the city choosen
            var CityID = (from cityfromDB in DB.Cities
                          where cityfromDB.Name == city
                          select cityfromDB.ID).Max();
            //getting the ID of the Specialty choosen
            var MAXSpecialtyID = (from Special in DB.Specialties
                                  select Special.ID).Max();
            DateTime Date = new DateTime(year, month, day);

            SysUser thenewUser = new SysUser();
            thenewUser.ID = MAXID + 1;
            thenewUser.UserName = username;
            thenewUser.Password = password;
            thenewUser.PhoneNumber = phonenumber;
            thenewUser.EmailAddress = email;
            thenewUser.City = CityID;
            thenewUser.Address = address;
            thenewUser.Admin = admin;
            thenewUser.Ban = ban;
            DB.SysUsers.InsertOnSubmit(thenewUser);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }

            Specialty thenewSpecialty = new Specialty();
            thenewSpecialty.SpecialtyTitle = Specialty;
            thenewSpecialty.ID = MAXSpecialtyID + 1;
            thenewSpecialty.SysUserID = MAXID + 1;
            DB.Specialties.InsertOnSubmit(thenewSpecialty);

            Doctor thenewDoctor = new Doctor();
            thenewDoctor.ID = MAXID + 1;
            thenewDoctor.FirstName = firstname;
            thenewDoctor.LastName = Lastname;
            thenewDoctor.DoB = Date;
            DB.Doctors.InsertOnSubmit(thenewDoctor);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void AddUser(string username, string password, string phonenumber, string email, string city, string address, bool admin, bool ban, string Labname, string LabType, string Specialty)
        {
            //checking the lastID in the Sysusers table
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var MAXID = (from user in DB.SysUsers
                         select user.ID).Max();
            //getting the ID of the city choosen
            var CityID = (from cityfromDB in DB.Cities
                          where cityfromDB.Name == city
                          select cityfromDB.ID).Max();
            //getting the ID of the Specialty choosen
            var MAXSpecialtyID = (from Special in DB.Specialties
                                  select Special.ID).Max();
            var MAXLabTypeID = (from LabTypefromDB in DB.LabTypes
                                select LabTypefromDB.ID).Max();

            SysUser thenewUser = new SysUser();
            thenewUser.ID = MAXID + 1;
            thenewUser.UserName = username;
            thenewUser.Password = password;
            thenewUser.PhoneNumber = phonenumber;
            thenewUser.EmailAddress = email;
            thenewUser.City = CityID;
            thenewUser.Address = address;
            thenewUser.Admin = admin;
            thenewUser.Ban = ban;
            DB.SysUsers.InsertOnSubmit(thenewUser);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }


            Specialty thenewSpecialty = new Specialty();
            thenewSpecialty.SpecialtyTitle = Specialty;
            thenewSpecialty.ID = MAXSpecialtyID + 1;
            thenewSpecialty.SysUserID = MAXID + 1;
            DB.Specialties.InsertOnSubmit(thenewSpecialty);

            Lab thenewLab = new Lab();
            thenewLab.ID = MAXID + 1;
            thenewLab.Name = Labname;
            thenewLab.Type = MAXLabTypeID + 1;
            DB.Labs.InsertOnSubmit(thenewLab);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
            LabType thenewLabType = new LabType();
            thenewLabType.ID = MAXLabTypeID + 1;
            thenewLabType.LabID = MAXID + 1;
            thenewLabType.TypeString = LabType;
            DB.LabTypes.InsertOnSubmit(thenewLabType);
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void DeleteUser(int ID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var deletedUser = from user in DB.SysUsers
                              where user.ID == ID
                              select user;
            var deletedDoctor = from Doc in DB.Doctors
                                where Doc.ID == ID
                                select Doc;
            var deleteLab = from labfromDB in DB.Labs
                            where labfromDB.ID == ID
                            select labfromDB;
            var deleteLabType = from labtypefromDB in DB.LabTypes
                                where labtypefromDB.LabID == ID
                                select labtypefromDB;
            var deleteSpecialty = from Special in DB.Specialties
                                  where Special.SysUserID == ID
                                  select Special;
            var deleteTreatents = from Treat in DB.Treatments
                                  where Treat.DoctorID == ID
                                  select Treat;
            var deleteRequestedItemsD = from ReqItem in DB.RequestedItems
                                        where ReqItem.DoctorID == ID
                                        select ReqItem;
            var deleteRequestedItemsL = from ReqItem in DB.RequestedItems
                                        where ReqItem.LabID == ID
                                        select ReqItem;
            #region DeleteRequestedItems
            foreach (var row in deleteRequestedItemsD)
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
            foreach (var row in deleteRequestedItemsL)
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
            #endregion
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
            #region DeleteLabType+Treatments+Speciality
            foreach (var row in deleteLabType)
            {
                DB.LabTypes.DeleteOnSubmit(row);
            }
            foreach (var row in deleteTreatents)
            {
                DB.Treatments.DeleteOnSubmit(row);
            }
            foreach (var row in deleteSpecialty)
            {
                DB.Specialties.DeleteOnSubmit(row);
            }
            #endregion
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
            #region DeleteDoctor+Lab
            foreach (var row in deletedDoctor)
            {
                DB.Doctors.DeleteOnSubmit(row);
            }
            foreach (var row in deleteLab)
            {
                DB.Labs.DeleteOnSubmit(row);
            }
            #endregion
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
            #region DeleteSysUser
            foreach (var row in deletedUser)
            {
                DB.SysUsers.DeleteOnSubmit(row);
            }
            #endregion
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void BanUser(int ID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var user = (from userfromDB in DB.SysUsers
                        where userfromDB.ID == ID
                        select userfromDB).Single();
            user.Ban = true;
            try
            {
                DB.SubmitChanges();

            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void UNBanUser(int ID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var user = (from userfromDB in DB.SysUsers
                        where userfromDB.ID == ID
                        select userfromDB).Single();
            user.Ban = false;
            try
            {
                DB.SubmitChanges();

            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void ModifyUser(int ID, string password, string phonenumber, string email, string city, string address, bool admin, bool ban, string firstname, string Lastname, int day, int month, int year, string Specialty)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var User = (from userfromDB in DB.SysUsers
                        where userfromDB.ID == ID
                        select userfromDB).Single();
            var Doc = (from DocfromDB in DB.Doctors
                       where DocfromDB.ID == ID
                       select DocfromDB).Single();
            var Spec = (from Special in DB.Specialties
                        where Special.SysUserID == ID
                        select Special).Single();
            var CityID = (from cityfromDB in DB.Cities
                          where cityfromDB.Name == city
                          select cityfromDB.ID).Max();
            User.Password = password;
            User.PhoneNumber = phonenumber;
            User.EmailAddress = email;
            User.City = CityID;
            User.Address = address;
            User.Admin = admin;
            User.Ban = ban;
            Doc.FirstName = firstname;
            Doc.LastName = Lastname;
            DateTime Date = new DateTime(year, month, day);
            Doc.DoB = Date;
            Spec.SpecialtyTitle = Specialty;
            try
            {
                DB.SubmitChanges();
            }
            catch
            {
                DB.SubmitChanges();
            }
        }
        public static void ModifyUser(int ID, string password, string phonenumber, string email, string city, string address, bool admin, bool ban, string Labname, string LabType, string Specialty)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var User = (from userfromDB in DB.SysUsers
                        where userfromDB.ID == ID
                        select userfromDB).Single();
            var lab = (from LabfromDB in DB.Labs
                       where LabfromDB.ID == ID
                       select LabfromDB).Single();
            var labtype = (from LabTypefromDB in DB.LabTypes
                           where LabTypefromDB.LabID == ID
                           select LabTypefromDB).Single();
            var Spec = (from Special in DB.Specialties
                        where Special.SysUserID == ID
                        select Special).Single();
            var CityID = (from cityfromDB in DB.Cities
                          where cityfromDB.Name == city
                          select cityfromDB.ID).Max();
            User.Password = password;
            User.PhoneNumber = phonenumber;
            User.EmailAddress = email;
            User.City = CityID;
            User.Address = address;
            User.Admin = admin;
            User.Ban = ban;
            lab.Name = Labname;
            labtype.TypeString = LabType;
            Spec.SpecialtyTitle = Specialty;
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