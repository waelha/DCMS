using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DCMS_V7.App_Code
{
    public static class C_GlobalActivities
    {
        public static bool CheckUsernameAndPassword(string Username, string Password)
        {

            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            IEnumerable<int> query = (from user in DB.SysUsers
                                      where user.UserName == Username && user.Password == Password
                                      select user.ID);
            if (query.Count<int>() == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        public static bool CheckIfBanned(int UserID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            IEnumerable<int> query = (from user in DB.SysUsers
                                      where user.ID == UserID && user.Ban == true
                                      select user.ID);
            if (query.Count<int>() == 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }
        public static bool CheckIfAdmin(int UserID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            IEnumerable<int> query = (from user in DB.SysUsers
                                      where user.ID == UserID && user.Admin == true
                                      select user.ID);
            if (query.Count<int>() == 0)
            {
                return false;
            }
            else
            {
                return true;
            }

        }
        public static int GetUserID(string Username)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            int query = (from user in DB.SysUsers
                         where user.UserName == Username
                         select user.ID).Single<int>();
            return query;

        }
        public static List<Patient> GetPatientsContains(string name)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var patFirstname = from PatientfromDB in DB.Patients
                               where PatientfromDB.FirstName.Contains(name)
                               select PatientfromDB;
            var patLastname = from PatientfromDB in DB.Patients
                              where PatientfromDB.LastName.Contains(name)
                              select PatientfromDB;
            return patFirstname.ToList().Union(patLastname).ToList();
        }
        public static List<Lab> GetListofLabs()
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var labs = from L in DB.Labs
                       select L;
            return labs.ToList();
        }
        public static List<ImageType> GetListofImagetypes()
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var types = from T in DB.ImageTypes
                        select T;
            return types.ToList();
        }

        public static List<Country> GetListofCountries()
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var countries = from C in DB.Countries
                            select C;
            return countries.ToList();
        }
        public static List<City> GetListofCities(string country)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var countryID = (from C in DB.Countries
                             where C.Name == country
                             select C.ID).Single();
            var Cities = from city in DB.Cities
                         where city.CountryID == countryID
                         select city;
            return Cities.ToList();
        }
        public static string CheckUserType(int ID)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            try
            {
                var TypeD = (from U in DB.Doctors
                             where U.ID == ID
                             select U).ToArray();
                if (TypeD.Count() != 0)
                {
                    return "Doctor.aspx";
                }
                else
                {
                    var TypeL = (from L in DB.LabTypes
                                 where L.LabID == ID
                                 select L.TypeString).ToArray();
                    return TypeL[0] + ".aspx";
                }
            }
            catch { return "Error.aspx"; }
        }
        public static SysUser GetUserInfo(String Username)
        {
            DCMS_DBDataContext DB = new DCMS_DBDataContext();
            var User = (from U in DB.SysUsers
                        where U.UserName == Username
                        select U).Single();
            return User;
        }
    }
}